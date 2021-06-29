<?php

namespace App\Http\Controllers\Api;

use App\Http\Requests\FillBalanceRequest;
use App\Http\Requests\TransferFormRequest;
use App\Models\Transfer;
use App\Models\User;
use App\Traits\BalanceFillUpHistory;
use App\Traits\TransfersHistory;
use Illuminate\Http\JsonResponse;

class UsersController extends Controller
{
    use BalanceFillUpHistory, TransfersHistory;

    public function __construct()
    {
        $this->middleware('auth:api', ['only' => ['showUserBalanceHistory', 'transfer']]);
        $this->middleware('admin', ['only' => 'showAllTransfers']);
    }

    public function fillBalance(FillBalanceRequest $request) {
        $data = $request->validated();
        $user = User::where('id', $data['user_id']);
        if (!$this->checkIfUserExists($user)) {
            return response()->json(
                ['message' => 'User with this id does not exists!']
            );
        }
        $user = $user->first();
        $userBalance = $user['balance'];
        $user->update(['balance' => $userBalance + $data['amount']]);
        $user->save();

        // update user's balance history
        $this->updateUserBalanceHistory($user['id'], $userBalance, $data['amount']);

        return response()->json(['message' => 'The amount added to user balance']);
    }

    /**
     * @param TransferFormRequest $request
     * @return JsonResponse
     */
    public function transfer(TransferFormRequest $request)
    {
        $data = $request->validated();
        $commission = $this->getCommission($data['amount']);

        // check if auth user has enough balance to perform transaction
        if (!$this->ifUserHasBalanceForTransfer($data['amount'], $commission)) {
            return response()->json(
                ['message' => 'You dont have enough balance to perform this transaction']
            );
        }
        // check if target user exists
        $targetUser = User::where('id', $data['user_id']);
        if (!$this->checkIfUserExists($targetUser)) {
            return response()->json(
                ['message' => 'User with this id does not exists!']
            );
        }

        // transfer amount
        $this->subtractAmountFromUser($data['amount'], $commission);
        $this->transferAmount($data['user_id'], $data['amount']);

        // add transfer into history
        $this->updateTransfersHistory(auth()->id(),$data['user_id'], $data['amount'], $commission);
        $this->updateUserBalanceHistory($data['user_id'],
            User::where('id', $data['user_id'])->first()->balance,
            $data['amount']
        );
        return response()->json(['message' => 'The amount was transferred successfully']);
    }

    /**
     * @return JsonResponse
     */
    public function showUserTransfers()
    {
        $data = auth()->user()->transactions;

        return response()->json(['message' => $data]);
    }

    /**
     * @return JsonResponse
     */
    public function showAllTransfers()
    {
        $data = Transfer::all();

        return response()->json(['message' => $data]);
    }

    /**
     * @return JsonResponse
     */
    public function showUserBalanceHistory()
    {
        $data = auth()->user()->balanceHistories;
        return response()->json(['message' => $data]);
    }

    /**
     * @param $amount
     * @param $commission
     * @return bool
     */
    public function ifUserHasBalanceForTransfer($amount, $commission)
    {
        if (auth()->user()->balance < $amount + $commission) {
            return false;
        }
        return true;
    }

    /**
     * @param $amount
     * @param $commission
     */
    public function subtractAmountFromUser($amount, $commission)
    {
        $user = auth()->user();
        $user->update(['balance' => $user['balance'] - ($amount + $commission)]);
        $user->save();
    }

    /**
     * @param $userId
     * @param $amount
     */
    public function transferAmount($userId, $amount)
    {
        $user = User::where('id', $userId)->first();
        $user->update(['balance' => $user['amount'] + $amount]);
        $user->save();
    }

    /**
     * @param $amount
     * @return float|int
     */
    public function getCommission($amount)
    {
        return $amount / 100;
    }
}

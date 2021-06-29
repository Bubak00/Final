<?php


namespace App\Traits;


use App\Models\BalanceHistory;

trait BalanceFillUpHistory
{

    public function updateUserBalanceHistory($userId, $balanceBeforeTransaction, $amount)
    {
        BalanceHistory::create([
            'user_id' => $userId,
            'amount' => $amount,
            'balance_before_transaction' => $balanceBeforeTransaction,
        ]);
    }
}

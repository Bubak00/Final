<?php


namespace App\Traits;


use App\Models\BalanceHistory;
use App\Models\Transfer;

trait TransfersHistory
{

    /**
     * @param $senderId
     * @param $recipientId
     * @param $amount
     * @param $commission
     */
    public function updateTransfersHistory($senderId, $recipientId, $amount, $commission)
    {
        Transfer::create([
            'sender_user_id' => $senderId,
            'recipient_user_id' => $recipientId,
            'amount' => $amount,
            'commission_amount' => $commission
        ]);
    }
}

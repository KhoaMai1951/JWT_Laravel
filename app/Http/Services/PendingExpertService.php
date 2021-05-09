<?php


namespace App\Http\Services;


use App\Http\Models\PendingExpert;

class PendingExpertService
{
    public function find($userId)
    {
        return PendingExpert::select('user_id')
            ->where('user_id', '=', $userId)
            ->get()
            ->toArray();
    }
}

<?php

namespace App\Http\Livewire\Classes;

/**
 * Create Custom Ports
 */
class Mageni
{
    public static function enabled(string $feature)
    {
        return in_array($feature, config('mageni.features', []));
    }

    public static function optionEnabled(string $feature, string $option)
    {
        return static::enabled($feature) &&
               config("mageni-options.{$feature}.{$option}") === true;
    }

    public static function accountDeletion()
    {
        return 'account-deletion';
    }
}

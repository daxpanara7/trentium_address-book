<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;
use App\Models\AddressBook;

class PromotionalEmail extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     */
    public $entry;
    /**
     * Create a new message instance.
     */
    public function __construct(AddressBook $entry)
    {
        $this->entry = $entry;
    }

    public function build()
    {
        return $this->subject('Exciting Offers Await!')
                    ->view('emails.promotional'); 
    }

}

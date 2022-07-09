#!/usr/bin/perl
use strict;
use warnings;
use Crypt::CBC;
use MIME::Base64;

Package "encrypt";

sub encrypt {

    my ($file, $key, $iv) = @_;

    my $cipher = Crypt::CBC->new(
        -key => $key,
        -cipher => 'Crypt::OpenSSL::AES',
        -header => 'none',
        -iv => $iv,
        -padding => 'standard',
        -literal_key => 1
    );

    print "[ DEBUG ] ENCRYPTIN...\n";
    print "[ ARG ] Key...: $key\n";
    print "[ ARG ] IV....: $iv\n";
    print "[ ARG ] File..: $file\n";
    open(my $fh, '<', $file) or die "[ DEBUG ] Could not open file $file: $!\n";
    my $encrypted = $cipher->encrypt($fh->readall);
    close($fh);

}

sub decrypt {
    my ($file, $key, $iv) = @_;
    my $cipher = Crypt::CBC->new(
        -key => $key,
        -cipher => 'Crypt::OpenSSL::AES',
        -header => 'none',
        -iv => $iv,
        -padding => 'standard',
        -literal_key => 1
    );
    if (!$key) {
        $key = "2v34oixji4fgyv346c94805098c0h0u340TRHVERTCHEhceyjc59h90u34590hu90fgHGSFQWDLKh23492x98j349xg293j45gCEYTJEYCEJEyjx98j392veytJEYJg9349gBirdSecurity";
    }
    print "[ DEBUG ] DECRYPTING...\n";
    print "[ ARG ] Key...: $key\n";
    print "[ ARG ] IV....: $iv\n";
    print "[ ARG ] File..: $file\n";
    open(my $fh, '<', $file) or die "[ DEBUG ] Could not open file $file: $!\n";
    my $decrypted = $cipher->decrypt($fh->readall);
    close($fh);
}

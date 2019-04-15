package LWP::UserAgent::Plugin::Delay;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;
use Log::ger;

sub after_request {
    my ($self, $r) = @_;

    my $secs = $r->{config}{between_request} // 1;
    log_trace "Sleeping %.1f second(s) between LWP::UserAgent request ...", $secs;
    sleep $secs;
    1;
}

1;
# ABSTRACT: Delay/sleep between requests

=for Pod::Coverage .+

=head1 SYNOPSIS

 use LWP::UserAgent::Plugin 'Delay' => {
     between_request => 3, # optional, default 1
 };

 my $ua = LWP::UserAgent::Plugin->new;
 $ua->get("http://www.example.com/");
 $ua->get("http://www.example.com/"); # will sleep 3 seconds first


=head1 DESCRIPTION

This plugin inserts C<sleep()> between requests.


=head1 CONFIGURATION

=head2 between_requests

Ufloat. Default: 1.


=head1 SEE ALSO

L<HTTP::Tiny::Plugin::Delay>

L<LWP::UserAgent::Plugin>

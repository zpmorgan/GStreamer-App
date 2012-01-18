package GStreamer::App;
use Gtk2;
require DynaLoader;
our @ISA = qw(DynaLoader);
our $VERSION = '1.00';
sub dl_load_flags {0x01};
bootstrap GStreamer::App $VERSION;
1;

=head1 NAME

GStreamer::App - Appsink & Appsrc

=cut

__END__
# pod omitted for brevity, but you mustn't forget it!

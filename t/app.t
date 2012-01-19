#!/usr/bin/perl
use strict;
use warnings;
use Test::More tests => 3;

use Glib qw(TRUE FALSE);
use GStreamer -init;
use_ok "GStreamer::App";

use File::Spec;
my $testfile = File::Spec->rel2abs ('test.avi');


{#audio test appsrc -> ?? -> appsink
   my $pipeline = GStreamer::Pipeline->new('foo');
   my $audio_sink = GStreamer::ElementFactory->make ("appsink", "apsnk");
   my $audio_src = GStreamer::ElementFactory->make ('appsrc','apsrc');
   $pipeline->add ($audio_src,$audio_sink);
   $audio_src->link($audio_sink);
   diag $pipeline->set_state('playing');

   my $test_data = join '', ('a'..'z');
   my $inbuf = GStreamer::Buffer->new();
   $inbuf->set_data($test_data);
   $audio_src->push_buffer($inbuf);
   $audio_src->end_of_stream();

   my $outbuf = $audio_sink->pull_buffer();
   isa_ok($outbuf, 'GStreamer::Buffer', 'pull_buffer returns buffer.');
   is ($test_data, $outbuf->data);
}

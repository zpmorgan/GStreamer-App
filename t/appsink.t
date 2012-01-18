#!/usr/bin/perl
use strict;
use warnings;
use Test::More tests => 4;

use Glib qw(TRUE FALSE);
use GStreamer -init;
use_ok "GStreamer::App";


my $generic_sink = GStreamer::AppSink->new();
isa_ok ($generic_sink, 'GStreamer::AppSink', 'appsink created.');
my $audio_sink = GStreamer::ElementFactory->make ("appsink", "audio-app-sink");
isa_ok ($audio_sink, 'GStreamer::AppSink', 'audio appsink created.');
my $video_sink = GStreamer::ElementFactory->make ("appsink", "video-app-sink");
isa_ok ($video_sink, 'GStreamer::AppSink', 'video appsink created.');

SKIP:{
   my $player = GStreamer::ElementFactory -> make(playbin2 => "player");
   my $audio_sink = GStreamer::ElementFactory->make ("appsink", "audio-app-sink");
   my $video_sink = GStreamer::ElementFactory->make ("fakesink", "video-fake-sink");
   $video_sink->set("sync", TRUE);

   $player->set(
      "audio-sink" => $audio_sink,
      "video-sink" => $video_sink,
      "flags" => [qw/ video audio /],
   );
   $player -> set(uri => Glib::filename_to_uri 'test.avi', "localhost");
#   $player->set_state('playing');
   $player->set_state('paused');
   my @state = $player->get_state(-1);
   is ($state[0],'success', 'playbin2 is fine.');
}

   #$audio_sink->pull_preroll();



#include "gstappperl.h"

MODULE = GStreamer::AppSink PACKAGE = GStreamer::AppSink PREFIX = gst_app_sink_

void gst_app_sink_set_caps (GstAppSink *appsink ,const GstCaps *caps);

GstCaps *gst_app_sink_get_caps (GstAppSink *appsink);

gboolean gst_app_sink_is_eos (GstAppSink *appsink);

void gst_app_sink_set_emit_signals (GstAppSink *appsink, gboolean emit);

gboolean gst_app_sink_get_emit_signals (GstAppSink *appsink);

void gst_app_sink_set_max_buffers (GstAppSink *appsink, guint max);

guint gst_app_sink_get_max_buffers (GstAppSink *appsink);

void gst_app_sink_set_drop (GstAppSink *appsink, gboolean drop);

gboolean gst_app_sink_get_drop (GstAppSink *appsink);

GstBuffer* gst_app_sink_pull_preroll (GstAppSink *appsink);

GstBuffer* gst_app_sink_pull_buffer (GstAppSink *appsink);

#This doesn't work. I don't see the point of buffer lists anyways.
void
gst_app_sink_pull_buffer_list (GstAppSink *appsink);
   INIT:
      int i;
      int j;
      GstBufferListIterator *it;
      GstBufferList *buflist;
      GstBuffer *buf;
   CODE:
      buflist = gst_app_sink_pull_buffer_list(appsink);
      it = gst_buffer_list_iterate (buflist);
      while (gst_buffer_list_iterator_next_group (it)) {
         while ((buf = gst_buffer_list_iterator_next (it)) != NULL) {
            XPUSHs( newSVGstBuffer (buf));
         }
      }

#typedef struct {
#   void          (*eos)              (GstAppSink *sink, gpointer user_data);
#   GstFlowReturn (*new_preroll)      (GstAppSink *sink, gpointer user_data);
#   GstFlowReturn (*new_buffer)       (GstAppSink *sink, gpointer user_data);
#   GstFlowReturn (*new_buffer_list)  (GstAppSink *sink, gpointer user_data);
#} GstAppSinkCallbacks;


# FIXME
# according to the appsink doc, signals are slower, but more flexible than callbacks.
# This should surely take a hashref & user_data; I dunno what gdestroynotify is about.
#void  gst_app_sink_set_callbacks (
#      GstAppSink *appsink,
#      GstAppSinkCallbacks *callbacks,
#      gpointer user_data,
#      GDestroyNotify notify
#);









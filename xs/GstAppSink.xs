

#include "gstappperl.h"

MODULE = GStreamer::AppSink PACKAGE = GStreamer::AppSink PREFIX = gst_app_sink

#void                gst_app_sink_set_caps               (GstAppSink *appsink,
#                                                         const GstCaps *caps);
void gst_app_sink_set_caps (GstAppSink *appsink ,const GstCaps *caps);

#GstCaps *           gst_app_sink_get_caps               (GstAppSink *appsink);
GstCaps *gst_app_sink_get_caps (GstAppSink *appsink);

#gboolean            gst_app_sink_is_eos                 (GstAppSink *appsink);
gboolean gst_app_sink_is_eos (GstAppSink *appsink);

void gst_app_sink_set_emit_signals (GstAppSink *appsink, gboolean emit);

gboolean gst_app_sink_get_emit_signals (GstAppSink *appsink);

void gst_app_sink_set_max_buffers (GstAppSink *appsink, guint max);

guint gst_app_sink_get_max_buffers (GstAppSink *appsink);

void gst_app_sink_set_drop (GstAppSink *appsink, gboolean drop);

gboolean gst_app_sink_get_drop (GstAppSink *appsink);

GstBuffer* gst_app_sink_pull_preroll           (GstAppSink *appsink);
GstBuffer* gst_app_sink_pull_buffer            (GstAppSink *appsink);
GstBufferList* gst_app_sink_pull_buffer_list       (GstAppSink *appsink);

#typedef struct {
#   void          (*eos)              (GstAppSink *sink, gpointer user_data);
#   GstFlowReturn (*new_preroll)      (GstAppSink *sink, gpointer user_data);
#   GstFlowReturn (*new_buffer)       (GstAppSink *sink, gpointer user_data);
#   GstFlowReturn (*new_buffer_list)  (GstAppSink *sink, gpointer user_data);
#} GstAppSinkCallbacks;


# FIXME
#void  gst_app_sink_set_callbacks (
#      GstAppSink *appsink,
#      GstAppSinkCallbacks *callbacks,
#      gpointer user_data,
#      GDestroyNotify notify
#);









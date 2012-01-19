#include "gstappperl.h"

MODULE = GStreamer::AppSrc PACKAGE = GStreamer::AppSrc PREFIX = gst_app_src_


void  gst_app_src_set_caps  (GstAppSrc *appsrc, const GstCaps *caps);

GstCaps*  gst_app_src_get_caps  (GstAppSrc *appsrc);

void    gst_app_src_set_size  (GstAppSrc *appsrc, gint64 size);

gint64  gst_app_src_get_size  (GstAppSrc *appsrc);

void    gst_app_src_set_stream_type  (GstAppSrc *appsrc, GstAppStreamType type);

GstAppStreamType gst_app_src_get_stream_type  (GstAppSrc *appsrc);


void  gst_app_src_set_max_bytes    (GstAppSrc *appsrc, guint64 max);

guint64   gst_app_src_get_max_bytes    (GstAppSrc *appsrc);

#FIXME: deal with guint64 pointers..
#void  gst_app_src_get_latency      (GstAppSrc *appsrc, guint64 *min, guint64 *max);

void  gst_app_src_set_latency      (GstAppSrc *appsrc, guint64 min, guint64 max);

void  gst_app_src_set_emit_signals (GstAppSrc *appsrc, gboolean emit);

gboolean  gst_app_src_get_emit_signals (GstAppSrc *appsrc);

GstFlowReturn gst_app_src_push_buffer  (GstAppSrc *appsrc, GstBuffer *buffer);

GstFlowReturn gst_app_src_end_of_stream (GstAppSrc *appsrc);

# FIXME
#void             gst_app_src_set_callbacks    (GstAppSrc * appsrc,
#                                               GstAppSrcCallbacks *callbacks,
#                                               gpointer user_data,
#                                               GDestroyNotify notify);


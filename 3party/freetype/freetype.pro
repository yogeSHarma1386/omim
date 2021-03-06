TEMPLATE = lib
CONFIG += staticlib
INCLUDEPATH += ./include
DEFINES += FT2_BUILD_LIBRARY \

ROOT_DIR = ../..

include($$ROOT_DIR/common.pri)

CONFIG -= warn_on
CONFIG *= warn_off

linux-g++* {
  DEFINES += OMIM_FULL_FREETYPE
}

SOURCES += \
    src/autofit/afangles.c \
    src/autofit/afblue.c \
    src/autofit/afcjk.c \
    src/autofit/afdummy.c \
    src/autofit/afglobal.c \
    src/autofit/afhints.c \
    src/autofit/afindic.c \
    src/autofit/aflatin.c \
    src/autofit/afloader.c \
    src/autofit/afmodule.c \
    src/autofit/afranges.c \
    src/autofit/afwarp.c \
    src/autofit/hbshim.c \
    src/base/ftadvanc.c \
    src/base/ftbitmap.c \
    src/base/ftcalc.c \
    src/base/ftgloadr.c \
    src/base/ftglyph.c \
    src/base/ftinit.c \
    src/base/ftobjs.c \
    src/base/ftoutln.c \
    src/base/ftrfork.c \
    src/base/ftstream.c \
    src/base/ftstroke.c \
    src/base/ftsystem.c \
    src/base/fttrigon.c \
    src/base/ftutil.c \
    src/bdf/bdfdrivr.c \
    src/bdf/bdflib.c \
    src/cache/ftcbasic.c \
    src/cache/ftccache.c \
    src/cache/ftccmap.c \
    src/cache/ftcglyph.c \
    src/cache/ftcimage.c \
    src/cache/ftcmanag.c \
    src/cache/ftcmru.c \
    src/cache/ftcsbits.c \
    src/cff/cf2ft.c \
    src/cff/cf2font.c \
    src/cff/cf2blues.c \
    src/cff/cf2intrp.c \
    src/cff/cf2stack.c \
    src/cff/cf2arrst.c \
    src/cff/cf2hints.c \
    src/cff/cf2error.c \
    src/cff/cf2read.c \
    src/cff/cffcmap.c \
    src/cff/cffdrivr.c \
    src/cff/cffgload.c \
    src/cff/cffload.c \
    src/cff/cffobjs.c \
    src/cff/cffparse.c \
    src/cid/cidriver.c \
    src/cid/cidgload.c \
    src/cid/cidload.c \
    src/cid/cidobjs.c \
    src/cid/cidparse.c \
    src/gzip/ftgzip.c \
    src/lzw/ftlzw.c \
    src/pcf/pcfdrivr.c \
    src/pcf/pcfread.c \
    src/pcf/pcfutil.c \
    src/pfr/pfrcmap.c \
    src/pfr/pfrdrivr.c \
    src/pfr/pfrgload.c \
    src/pfr/pfrload.c \
    src/pfr/pfrobjs.c \
    src/pfr/pfrsbit.c \
    src/psaux/afmparse.c \
    src/psaux/psauxmod.c \
    src/psaux/psconv.c \
    src/psaux/psobjs.c \
    src/psaux/t1cmap.c \
    src/psaux/t1decode.c \
    src/pshinter/pshalgo.c \
    src/pshinter/pshglob.c \
    src/pshinter/pshmod.c \
    src/pshinter/pshrec.c \
    src/psnames/psmodule.c \
    src/raster/ftraster.c \
    src/raster/ftrend1.c \
    src/sfnt/sfdriver.c \
    src/sfnt/sfobjs.c \
    src/sfnt/ttbdf.c \
    src/sfnt/ttcmap.c \
    src/sfnt/ttkern.c \
    src/sfnt/ttload.c \
    src/sfnt/ttmtx.c \
    src/sfnt/ttpost.c \
    src/sfnt/ttsbit.c \
    src/smooth/ftgrays.c \
    src/smooth/ftsmooth.c \
    src/truetype/ttdriver.c \
    src/truetype/ttgload.c \
    src/truetype/ttinterp.c \
    src/truetype/ttobjs.c \
    src/truetype/ttpload.c \
    src/truetype/truetype.c \
    src/type1/t1afm.c \
    src/type1/t1driver.c \
    src/type1/t1gload.c \
    src/type1/t1load.c \
    src/type1/t1objs.c \
    src/type1/t1parse.c \
    src/type42/t42drivr.c \
    src/type42/t42objs.c \
    src/type42/t42parse.c \
    src/type42/type42.c \
    src/winfonts/winfnt.c \
    src/cache/ftstrokedcache.c \

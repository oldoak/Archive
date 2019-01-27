# GNU Make project makefile autogenerated by Premake

ifndef config
  config=debug
endif

ifndef verbose
  SILENT = @
endif

.PHONY: clean prebuild prelink

ifeq ($(config),debug)
  RESCOMP = windres
  TARGETDIR = ${HOME}/build/WebSocketServer/bin/Debug
  TARGET = $(TARGETDIR)/WebSocketServer_g
  OBJDIR = ${HOME}/build/WebSocketServer/obj/Debug
  DEFINES += -D_DEBUG
  INCLUDES += -I/usr/include -I/usr/local/include -I${PWD}/../include -I/usr/local/opt/opencv3/include
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -g -g -O0 -Wall -fPIC -pthread -std=c++14
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS += -lPocoFoundation -lPocoNet -lPocoUtil -lopencv_core -lopencv_imgproc -lopencv_imgcodecs -lopencv_highgui
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib -L/usr/local/lib -L/usr/local/opt/opencv3/lib
  LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),release)
  RESCOMP = windres
  TARGETDIR = ${HOME}/build/WebSocketServer/bin/Release
  TARGET = $(TARGETDIR)/WebSocketServer
  OBJDIR = ${HOME}/build/WebSocketServer/obj/Release
  DEFINES += -D_REL
  INCLUDES += -I/usr/include -I/usr/local/include -I${PWD}/../include -I/usr/local/opt/opencv3/include
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -O2 -Wall -fPIC -pthread -std=c++14
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS += -lPocoFoundation -lPocoNet -lPocoUtil -lopencv_core -lopencv_imgproc -lopencv_imgcodecs -lopencv_highgui
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib -L/usr/local/lib -L/usr/local/opt/opencv3/lib -Wl,-x
  LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),machine)
  RESCOMP = windres
  TARGETDIR = ${HOME}/build/WebSocketServer/bin/Machine
  TARGET = $(TARGETDIR)/WebSocketServer
  OBJDIR = ${HOME}/build/WebSocketServer/obj/Machine
  DEFINES +=
  INCLUDES += -I/usr/include -I/usr/local/include -I${PWD}/../include -I/usr/local/opt/opencv3/include
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -Wall -fPIC -pthread -std=c++14
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS += -lPocoFoundation -lPocoNet -lPocoUtil -lopencv_core -lopencv_imgproc -lopencv_imgcodecs -lopencv_highgui
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib -L/usr/local/lib -L/usr/local/opt/opencv3/lib -Wl,-x
  LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

OBJECTS := \
	$(OBJDIR)/PageRequestHandler.o \
	$(OBJDIR)/RequestHandlerFactory.o \
	$(OBJDIR)/WebSocketRequestHandler.o \
	$(OBJDIR)/WebSocketServer.o \
	$(OBJDIR)/WebSocketServerMain.o \

RESOURCES := \

CUSTOMFILES := \

SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif

$(TARGET): $(GCH) ${CUSTOMFILES} $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking WebSocketServer
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning WebSocketServer
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
$(OBJECTS): $(GCH) $(PCH)
$(GCH): $(PCH)
	@echo $(notdir $<)
	$(SILENT) $(CXX) -x c++-header $(ALL_CXXFLAGS) -o "$@" -MF "$(@:%.gch=%.d)" -c "$<"
endif

$(OBJDIR)/PageRequestHandler.o: ../src/PageRequestHandler.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/RequestHandlerFactory.o: ../src/RequestHandlerFactory.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/WebSocketRequestHandler.o: ../src/WebSocketRequestHandler.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/WebSocketServer.o: ../src/WebSocketServer.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/WebSocketServerMain.o: ../src/WebSocketServerMain.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(OBJDIR)/$(notdir $(PCH)).d
endif
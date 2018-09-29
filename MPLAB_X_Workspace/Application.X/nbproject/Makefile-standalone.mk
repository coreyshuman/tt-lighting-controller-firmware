#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-standalone.mk)" "nbproject/Makefile-local-standalone.mk"
include nbproject/Makefile-local-standalone.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=standalone
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Application.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Application.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../../Source/Controller/Lighting.c ../../Source/Controller/Controller.c ../../Source/Controller/Animation.c ../../Source/Controller/Fan.c ../../Source/Controller/Eeprom.c ../../Source/Controller/Config.c ../../Source/Controller/Util.c ../../Source/USB/Usb_HID_tasks_application.c ../../Source/USB/usb_descriptors_app.c ../../Source/USB/usb_device.c ../../Source/USB/usb_function_hid.c ../../Source/Main.c ../../Source/Controller/Debug.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1332549744/Lighting.o ${OBJECTDIR}/_ext/1332549744/Controller.o ${OBJECTDIR}/_ext/1332549744/Animation.o ${OBJECTDIR}/_ext/1332549744/Fan.o ${OBJECTDIR}/_ext/1332549744/Eeprom.o ${OBJECTDIR}/_ext/1332549744/Config.o ${OBJECTDIR}/_ext/1332549744/Util.o ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o ${OBJECTDIR}/_ext/313519312/usb_device.o ${OBJECTDIR}/_ext/313519312/usb_function_hid.o ${OBJECTDIR}/_ext/1787047461/Main.o ${OBJECTDIR}/_ext/1332549744/Debug.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1332549744/Lighting.o.d ${OBJECTDIR}/_ext/1332549744/Controller.o.d ${OBJECTDIR}/_ext/1332549744/Animation.o.d ${OBJECTDIR}/_ext/1332549744/Fan.o.d ${OBJECTDIR}/_ext/1332549744/Eeprom.o.d ${OBJECTDIR}/_ext/1332549744/Config.o.d ${OBJECTDIR}/_ext/1332549744/Util.o.d ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o.d ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o.d ${OBJECTDIR}/_ext/313519312/usb_device.o.d ${OBJECTDIR}/_ext/313519312/usb_function_hid.o.d ${OBJECTDIR}/_ext/1787047461/Main.o.d ${OBJECTDIR}/_ext/1332549744/Debug.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1332549744/Lighting.o ${OBJECTDIR}/_ext/1332549744/Controller.o ${OBJECTDIR}/_ext/1332549744/Animation.o ${OBJECTDIR}/_ext/1332549744/Fan.o ${OBJECTDIR}/_ext/1332549744/Eeprom.o ${OBJECTDIR}/_ext/1332549744/Config.o ${OBJECTDIR}/_ext/1332549744/Util.o ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o ${OBJECTDIR}/_ext/313519312/usb_device.o ${OBJECTDIR}/_ext/313519312/usb_function_hid.o ${OBJECTDIR}/_ext/1787047461/Main.o ${OBJECTDIR}/_ext/1332549744/Debug.o

# Source Files
SOURCEFILES=../../Source/Controller/Lighting.c ../../Source/Controller/Controller.c ../../Source/Controller/Animation.c ../../Source/Controller/Fan.c ../../Source/Controller/Eeprom.c ../../Source/Controller/Config.c ../../Source/Controller/Util.c ../../Source/USB/Usb_HID_tasks_application.c ../../Source/USB/usb_descriptors_app.c ../../Source/USB/usb_device.c ../../Source/USB/usb_function_hid.c ../../Source/Main.c ../../Source/Controller/Debug.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-standalone.mk dist/${CND_CONF}/${IMAGE_TYPE}/Application.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX230F064D
MP_LINKER_FILE_OPTION=,--script="..\..\linker_scripts\app_32MX230F064D_standalone.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1332549744/Lighting.o: ../../Source/Controller/Lighting.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Lighting.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Lighting.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1332549744/Lighting.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DTRANSPORT_LAYER_USB -DBOARD_THERMALTAKE_CONTROLLER -D_SUPPRESS_PLIB_WARNING -I"../.." -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../../Include/Usb" -I"../../Include/HardwareProfile" -I"../../Include/USB" -I"../../Include/Framework" -I"../../Include/Controller" -MMD -MF "${OBJECTDIR}/_ext/1332549744/Lighting.o.d" -o ${OBJECTDIR}/_ext/1332549744/Lighting.o ../../Source/Controller/Lighting.c    -DXPRJ_standalone=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1332549744/Controller.o: ../../Source/Controller/Controller.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Controller.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Controller.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1332549744/Controller.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DTRANSPORT_LAYER_USB -DBOARD_THERMALTAKE_CONTROLLER -D_SUPPRESS_PLIB_WARNING -I"../.." -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../../Include/Usb" -I"../../Include/HardwareProfile" -I"../../Include/USB" -I"../../Include/Framework" -I"../../Include/Controller" -MMD -MF "${OBJECTDIR}/_ext/1332549744/Controller.o.d" -o ${OBJECTDIR}/_ext/1332549744/Controller.o ../../Source/Controller/Controller.c    -DXPRJ_standalone=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1332549744/Animation.o: ../../Source/Controller/Animation.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Animation.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Animation.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1332549744/Animation.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DTRANSPORT_LAYER_USB -DBOARD_THERMALTAKE_CONTROLLER -D_SUPPRESS_PLIB_WARNING -I"../.." -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../../Include/Usb" -I"../../Include/HardwareProfile" -I"../../Include/USB" -I"../../Include/Framework" -I"../../Include/Controller" -MMD -MF "${OBJECTDIR}/_ext/1332549744/Animation.o.d" -o ${OBJECTDIR}/_ext/1332549744/Animation.o ../../Source/Controller/Animation.c    -DXPRJ_standalone=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1332549744/Fan.o: ../../Source/Controller/Fan.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Fan.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Fan.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1332549744/Fan.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DTRANSPORT_LAYER_USB -DBOARD_THERMALTAKE_CONTROLLER -D_SUPPRESS_PLIB_WARNING -I"../.." -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../../Include/Usb" -I"../../Include/HardwareProfile" -I"../../Include/USB" -I"../../Include/Framework" -I"../../Include/Controller" -MMD -MF "${OBJECTDIR}/_ext/1332549744/Fan.o.d" -o ${OBJECTDIR}/_ext/1332549744/Fan.o ../../Source/Controller/Fan.c    -DXPRJ_standalone=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1332549744/Eeprom.o: ../../Source/Controller/Eeprom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Eeprom.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Eeprom.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1332549744/Eeprom.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DTRANSPORT_LAYER_USB -DBOARD_THERMALTAKE_CONTROLLER -D_SUPPRESS_PLIB_WARNING -I"../.." -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../../Include/Usb" -I"../../Include/HardwareProfile" -I"../../Include/USB" -I"../../Include/Framework" -I"../../Include/Controller" -MMD -MF "${OBJECTDIR}/_ext/1332549744/Eeprom.o.d" -o ${OBJECTDIR}/_ext/1332549744/Eeprom.o ../../Source/Controller/Eeprom.c    -DXPRJ_standalone=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1332549744/Config.o: ../../Source/Controller/Config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Config.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Config.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1332549744/Config.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DTRANSPORT_LAYER_USB -DBOARD_THERMALTAKE_CONTROLLER -D_SUPPRESS_PLIB_WARNING -I"../.." -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../../Include/Usb" -I"../../Include/HardwareProfile" -I"../../Include/USB" -I"../../Include/Framework" -I"../../Include/Controller" -MMD -MF "${OBJECTDIR}/_ext/1332549744/Config.o.d" -o ${OBJECTDIR}/_ext/1332549744/Config.o ../../Source/Controller/Config.c    -DXPRJ_standalone=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1332549744/Util.o: ../../Source/Controller/Util.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Util.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Util.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1332549744/Util.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DTRANSPORT_LAYER_USB -DBOARD_THERMALTAKE_CONTROLLER -D_SUPPRESS_PLIB_WARNING -I"../.." -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../../Include/Usb" -I"../../Include/HardwareProfile" -I"../../Include/USB" -I"../../Include/Framework" -I"../../Include/Controller" -MMD -MF "${OBJECTDIR}/_ext/1332549744/Util.o.d" -o ${OBJECTDIR}/_ext/1332549744/Util.o ../../Source/Controller/Util.c    -DXPRJ_standalone=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o: ../../Source/USB/Usb_HID_tasks_application.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DTRANSPORT_LAYER_USB -DBOARD_THERMALTAKE_CONTROLLER -D_SUPPRESS_PLIB_WARNING -I"../.." -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../../Include/Usb" -I"../../Include/HardwareProfile" -I"../../Include/USB" -I"../../Include/Framework" -I"../../Include/Controller" -MMD -MF "${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o.d" -o ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o ../../Source/USB/Usb_HID_tasks_application.c    -DXPRJ_standalone=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o: ../../Source/USB/usb_descriptors_app.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DTRANSPORT_LAYER_USB -DBOARD_THERMALTAKE_CONTROLLER -D_SUPPRESS_PLIB_WARNING -I"../.." -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../../Include/Usb" -I"../../Include/HardwareProfile" -I"../../Include/USB" -I"../../Include/Framework" -I"../../Include/Controller" -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o ../../Source/USB/usb_descriptors_app.c    -DXPRJ_standalone=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/313519312/usb_device.o: ../../Source/USB/usb_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_device.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/313519312/usb_device.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DTRANSPORT_LAYER_USB -DBOARD_THERMALTAKE_CONTROLLER -D_SUPPRESS_PLIB_WARNING -I"../.." -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../../Include/Usb" -I"../../Include/HardwareProfile" -I"../../Include/USB" -I"../../Include/Framework" -I"../../Include/Controller" -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_device.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_device.o ../../Source/USB/usb_device.c    -DXPRJ_standalone=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/313519312/usb_function_hid.o: ../../Source/USB/usb_function_hid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_function_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_function_hid.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/313519312/usb_function_hid.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DTRANSPORT_LAYER_USB -DBOARD_THERMALTAKE_CONTROLLER -D_SUPPRESS_PLIB_WARNING -I"../.." -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../../Include/Usb" -I"../../Include/HardwareProfile" -I"../../Include/USB" -I"../../Include/Framework" -I"../../Include/Controller" -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_function_hid.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_function_hid.o ../../Source/USB/usb_function_hid.c    -DXPRJ_standalone=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1787047461/Main.o: ../../Source/Main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1787047461" 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1787047461/Main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DTRANSPORT_LAYER_USB -DBOARD_THERMALTAKE_CONTROLLER -D_SUPPRESS_PLIB_WARNING -I"../.." -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../../Include/Usb" -I"../../Include/HardwareProfile" -I"../../Include/USB" -I"../../Include/Framework" -I"../../Include/Controller" -MMD -MF "${OBJECTDIR}/_ext/1787047461/Main.o.d" -o ${OBJECTDIR}/_ext/1787047461/Main.o ../../Source/Main.c    -DXPRJ_standalone=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1332549744/Debug.o: ../../Source/Controller/Debug.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Debug.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1332549744/Debug.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DTRANSPORT_LAYER_USB -DBOARD_THERMALTAKE_CONTROLLER -D_SUPPRESS_PLIB_WARNING -I"../.." -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../../Include/Usb" -I"../../Include/HardwareProfile" -I"../../Include/USB" -I"../../Include/Framework" -I"../../Include/Controller" -MMD -MF "${OBJECTDIR}/_ext/1332549744/Debug.o.d" -o ${OBJECTDIR}/_ext/1332549744/Debug.o ../../Source/Controller/Debug.c    -DXPRJ_standalone=$(CND_CONF)    $(COMPARISON_BUILD) 
	
else
${OBJECTDIR}/_ext/1332549744/Lighting.o: ../../Source/Controller/Lighting.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Lighting.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Lighting.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1332549744/Lighting.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DTRANSPORT_LAYER_USB -DBOARD_THERMALTAKE_CONTROLLER -D_SUPPRESS_PLIB_WARNING -I"../.." -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../../Include/Usb" -I"../../Include/HardwareProfile" -I"../../Include/USB" -I"../../Include/Framework" -I"../../Include/Controller" -MMD -MF "${OBJECTDIR}/_ext/1332549744/Lighting.o.d" -o ${OBJECTDIR}/_ext/1332549744/Lighting.o ../../Source/Controller/Lighting.c    -DXPRJ_standalone=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1332549744/Controller.o: ../../Source/Controller/Controller.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Controller.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Controller.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1332549744/Controller.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DTRANSPORT_LAYER_USB -DBOARD_THERMALTAKE_CONTROLLER -D_SUPPRESS_PLIB_WARNING -I"../.." -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../../Include/Usb" -I"../../Include/HardwareProfile" -I"../../Include/USB" -I"../../Include/Framework" -I"../../Include/Controller" -MMD -MF "${OBJECTDIR}/_ext/1332549744/Controller.o.d" -o ${OBJECTDIR}/_ext/1332549744/Controller.o ../../Source/Controller/Controller.c    -DXPRJ_standalone=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1332549744/Animation.o: ../../Source/Controller/Animation.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Animation.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Animation.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1332549744/Animation.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DTRANSPORT_LAYER_USB -DBOARD_THERMALTAKE_CONTROLLER -D_SUPPRESS_PLIB_WARNING -I"../.." -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../../Include/Usb" -I"../../Include/HardwareProfile" -I"../../Include/USB" -I"../../Include/Framework" -I"../../Include/Controller" -MMD -MF "${OBJECTDIR}/_ext/1332549744/Animation.o.d" -o ${OBJECTDIR}/_ext/1332549744/Animation.o ../../Source/Controller/Animation.c    -DXPRJ_standalone=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1332549744/Fan.o: ../../Source/Controller/Fan.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Fan.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Fan.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1332549744/Fan.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DTRANSPORT_LAYER_USB -DBOARD_THERMALTAKE_CONTROLLER -D_SUPPRESS_PLIB_WARNING -I"../.." -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../../Include/Usb" -I"../../Include/HardwareProfile" -I"../../Include/USB" -I"../../Include/Framework" -I"../../Include/Controller" -MMD -MF "${OBJECTDIR}/_ext/1332549744/Fan.o.d" -o ${OBJECTDIR}/_ext/1332549744/Fan.o ../../Source/Controller/Fan.c    -DXPRJ_standalone=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1332549744/Eeprom.o: ../../Source/Controller/Eeprom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Eeprom.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Eeprom.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1332549744/Eeprom.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DTRANSPORT_LAYER_USB -DBOARD_THERMALTAKE_CONTROLLER -D_SUPPRESS_PLIB_WARNING -I"../.." -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../../Include/Usb" -I"../../Include/HardwareProfile" -I"../../Include/USB" -I"../../Include/Framework" -I"../../Include/Controller" -MMD -MF "${OBJECTDIR}/_ext/1332549744/Eeprom.o.d" -o ${OBJECTDIR}/_ext/1332549744/Eeprom.o ../../Source/Controller/Eeprom.c    -DXPRJ_standalone=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1332549744/Config.o: ../../Source/Controller/Config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Config.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Config.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1332549744/Config.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DTRANSPORT_LAYER_USB -DBOARD_THERMALTAKE_CONTROLLER -D_SUPPRESS_PLIB_WARNING -I"../.." -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../../Include/Usb" -I"../../Include/HardwareProfile" -I"../../Include/USB" -I"../../Include/Framework" -I"../../Include/Controller" -MMD -MF "${OBJECTDIR}/_ext/1332549744/Config.o.d" -o ${OBJECTDIR}/_ext/1332549744/Config.o ../../Source/Controller/Config.c    -DXPRJ_standalone=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1332549744/Util.o: ../../Source/Controller/Util.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Util.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Util.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1332549744/Util.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DTRANSPORT_LAYER_USB -DBOARD_THERMALTAKE_CONTROLLER -D_SUPPRESS_PLIB_WARNING -I"../.." -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../../Include/Usb" -I"../../Include/HardwareProfile" -I"../../Include/USB" -I"../../Include/Framework" -I"../../Include/Controller" -MMD -MF "${OBJECTDIR}/_ext/1332549744/Util.o.d" -o ${OBJECTDIR}/_ext/1332549744/Util.o ../../Source/Controller/Util.c    -DXPRJ_standalone=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o: ../../Source/USB/Usb_HID_tasks_application.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DTRANSPORT_LAYER_USB -DBOARD_THERMALTAKE_CONTROLLER -D_SUPPRESS_PLIB_WARNING -I"../.." -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../../Include/Usb" -I"../../Include/HardwareProfile" -I"../../Include/USB" -I"../../Include/Framework" -I"../../Include/Controller" -MMD -MF "${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o.d" -o ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o ../../Source/USB/Usb_HID_tasks_application.c    -DXPRJ_standalone=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o: ../../Source/USB/usb_descriptors_app.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DTRANSPORT_LAYER_USB -DBOARD_THERMALTAKE_CONTROLLER -D_SUPPRESS_PLIB_WARNING -I"../.." -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../../Include/Usb" -I"../../Include/HardwareProfile" -I"../../Include/USB" -I"../../Include/Framework" -I"../../Include/Controller" -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o ../../Source/USB/usb_descriptors_app.c    -DXPRJ_standalone=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/313519312/usb_device.o: ../../Source/USB/usb_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_device.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/313519312/usb_device.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DTRANSPORT_LAYER_USB -DBOARD_THERMALTAKE_CONTROLLER -D_SUPPRESS_PLIB_WARNING -I"../.." -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../../Include/Usb" -I"../../Include/HardwareProfile" -I"../../Include/USB" -I"../../Include/Framework" -I"../../Include/Controller" -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_device.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_device.o ../../Source/USB/usb_device.c    -DXPRJ_standalone=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/313519312/usb_function_hid.o: ../../Source/USB/usb_function_hid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_function_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_function_hid.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/313519312/usb_function_hid.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DTRANSPORT_LAYER_USB -DBOARD_THERMALTAKE_CONTROLLER -D_SUPPRESS_PLIB_WARNING -I"../.." -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../../Include/Usb" -I"../../Include/HardwareProfile" -I"../../Include/USB" -I"../../Include/Framework" -I"../../Include/Controller" -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_function_hid.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_function_hid.o ../../Source/USB/usb_function_hid.c    -DXPRJ_standalone=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1787047461/Main.o: ../../Source/Main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1787047461" 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1787047461/Main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DTRANSPORT_LAYER_USB -DBOARD_THERMALTAKE_CONTROLLER -D_SUPPRESS_PLIB_WARNING -I"../.." -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../../Include/Usb" -I"../../Include/HardwareProfile" -I"../../Include/USB" -I"../../Include/Framework" -I"../../Include/Controller" -MMD -MF "${OBJECTDIR}/_ext/1787047461/Main.o.d" -o ${OBJECTDIR}/_ext/1787047461/Main.o ../../Source/Main.c    -DXPRJ_standalone=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1332549744/Debug.o: ../../Source/Controller/Debug.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Debug.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1332549744/Debug.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -DTRANSPORT_LAYER_USB -DBOARD_THERMALTAKE_CONTROLLER -D_SUPPRESS_PLIB_WARNING -I"../.." -I"../../Include" -I"../../Include/Usb/Stack" -I"../../Include/FrameWork" -I"../../Include/Usb" -I"../../Include/HardwareProfile" -I"../../Include/USB" -I"../../Include/Framework" -I"../../Include/Controller" -MMD -MF "${OBJECTDIR}/_ext/1332549744/Debug.o.d" -o ${OBJECTDIR}/_ext/1332549744/Debug.o ../../Source/Controller/Debug.c    -DXPRJ_standalone=$(CND_CONF)    $(COMPARISON_BUILD) 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Application.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../../microchip/harmony/v2_06/bin/framework/peripheral/PIC32MX230F064D_peripherals.a  ../../linker_scripts/app_32MX230F064D_standalone.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -o dist/${CND_CONF}/${IMAGE_TYPE}/Application.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\..\..\..\..\microchip\harmony\v2_06\bin\framework\peripheral\PIC32MX230F064D_peripherals.a      -DXPRJ_standalone=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,--gc-sections,-L"../../MPLAB_Workspace",-Map="$(BINDIR_)$(TARGETBASE).map"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Application.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../../microchip/harmony/v2_06/bin/framework/peripheral/PIC32MX230F064D_peripherals.a ../../linker_scripts/app_32MX230F064D_standalone.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -o dist/${CND_CONF}/${IMAGE_TYPE}/Application.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\..\..\..\..\microchip\harmony\v2_06\bin\framework\peripheral\PIC32MX230F064D_peripherals.a      -DXPRJ_standalone=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--gc-sections,-L"../../MPLAB_Workspace",-Map="$(BINDIR_)$(TARGETBASE).map"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Application.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/standalone
	${RM} -r dist/standalone

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif

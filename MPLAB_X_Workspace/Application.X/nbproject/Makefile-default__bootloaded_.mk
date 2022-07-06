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
ifeq "$(wildcard nbproject/Makefile-local-default__bootloaded_.mk)" "nbproject/Makefile-local-default__bootloaded_.mk"
include nbproject/Makefile-local-default__bootloaded_.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default__bootloaded_
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
COMPARISON_BUILD=-mafrlcsj
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
SOURCEFILES_QUOTED_IF_SPACED=../../Source/Controller/Lighting.c ../../Source/Controller/Controller.c ../../Source/Controller/Animation.c ../../Source/Controller/Fan.c ../../Source/Controller/Eeprom.c ../../Source/Controller/Config.c ../../Source/Controller/Util.c ../../Source/Controller/Debug.c ../../Source/USB/Usb_HID_tasks_application.c ../../Source/USB/usb_descriptors_app.c ../../Source/USB/usb_device.c ../../Source/USB/usb_function_hid.c ../../Source/Main.c ../../Source/Exception.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1332549744/Lighting.o ${OBJECTDIR}/_ext/1332549744/Controller.o ${OBJECTDIR}/_ext/1332549744/Animation.o ${OBJECTDIR}/_ext/1332549744/Fan.o ${OBJECTDIR}/_ext/1332549744/Eeprom.o ${OBJECTDIR}/_ext/1332549744/Config.o ${OBJECTDIR}/_ext/1332549744/Util.o ${OBJECTDIR}/_ext/1332549744/Debug.o ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o ${OBJECTDIR}/_ext/313519312/usb_device.o ${OBJECTDIR}/_ext/313519312/usb_function_hid.o ${OBJECTDIR}/_ext/1787047461/Main.o ${OBJECTDIR}/_ext/1787047461/Exception.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1332549744/Lighting.o.d ${OBJECTDIR}/_ext/1332549744/Controller.o.d ${OBJECTDIR}/_ext/1332549744/Animation.o.d ${OBJECTDIR}/_ext/1332549744/Fan.o.d ${OBJECTDIR}/_ext/1332549744/Eeprom.o.d ${OBJECTDIR}/_ext/1332549744/Config.o.d ${OBJECTDIR}/_ext/1332549744/Util.o.d ${OBJECTDIR}/_ext/1332549744/Debug.o.d ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o.d ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o.d ${OBJECTDIR}/_ext/313519312/usb_device.o.d ${OBJECTDIR}/_ext/313519312/usb_function_hid.o.d ${OBJECTDIR}/_ext/1787047461/Main.o.d ${OBJECTDIR}/_ext/1787047461/Exception.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1332549744/Lighting.o ${OBJECTDIR}/_ext/1332549744/Controller.o ${OBJECTDIR}/_ext/1332549744/Animation.o ${OBJECTDIR}/_ext/1332549744/Fan.o ${OBJECTDIR}/_ext/1332549744/Eeprom.o ${OBJECTDIR}/_ext/1332549744/Config.o ${OBJECTDIR}/_ext/1332549744/Util.o ${OBJECTDIR}/_ext/1332549744/Debug.o ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o ${OBJECTDIR}/_ext/313519312/usb_device.o ${OBJECTDIR}/_ext/313519312/usb_function_hid.o ${OBJECTDIR}/_ext/1787047461/Main.o ${OBJECTDIR}/_ext/1787047461/Exception.o

# Source Files
SOURCEFILES=../../Source/Controller/Lighting.c ../../Source/Controller/Controller.c ../../Source/Controller/Animation.c ../../Source/Controller/Fan.c ../../Source/Controller/Eeprom.c ../../Source/Controller/Config.c ../../Source/Controller/Util.c ../../Source/Controller/Debug.c ../../Source/USB/Usb_HID_tasks_application.c ../../Source/USB/usb_descriptors_app.c ../../Source/USB/usb_device.c ../../Source/USB/usb_function_hid.c ../../Source/Main.c ../../Source/Exception.c



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
	${MAKE}  -f nbproject/Makefile-default__bootloaded_.mk dist/${CND_CONF}/${IMAGE_TYPE}/Application.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX230F064D
MP_LINKER_FILE_OPTION=,--script="..\..\linker_scripts\app_32MX230F064D.ld"
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
${OBJECTDIR}/_ext/1332549744/Lighting.o: ../../Source/Controller/Lighting.c  .generated_files/flags/default__bootloaded_/c02b61e796e1b1bf694081a1023211fc9a1d1319 .generated_files/flags/default__bootloaded_/99f3dccf676a45fa6804d5afac85c14b7050b57f
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Lighting.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Lighting.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Lighting.o.d" -o ${OBJECTDIR}/_ext/1332549744/Lighting.o ../../Source/Controller/Lighting.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1332549744/Controller.o: ../../Source/Controller/Controller.c  .generated_files/flags/default__bootloaded_/2dc22d257a9ba64043c47f23999df3e0a6574590 .generated_files/flags/default__bootloaded_/99f3dccf676a45fa6804d5afac85c14b7050b57f
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Controller.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Controller.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Controller.o.d" -o ${OBJECTDIR}/_ext/1332549744/Controller.o ../../Source/Controller/Controller.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1332549744/Animation.o: ../../Source/Controller/Animation.c  .generated_files/flags/default__bootloaded_/cfd69a33c1138eef231eae6101b1f99e35080e60 .generated_files/flags/default__bootloaded_/99f3dccf676a45fa6804d5afac85c14b7050b57f
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Animation.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Animation.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Animation.o.d" -o ${OBJECTDIR}/_ext/1332549744/Animation.o ../../Source/Controller/Animation.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1332549744/Fan.o: ../../Source/Controller/Fan.c  .generated_files/flags/default__bootloaded_/d986fc6897e49040badef0edba48f99db6b1d0f9 .generated_files/flags/default__bootloaded_/99f3dccf676a45fa6804d5afac85c14b7050b57f
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Fan.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Fan.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Fan.o.d" -o ${OBJECTDIR}/_ext/1332549744/Fan.o ../../Source/Controller/Fan.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1332549744/Eeprom.o: ../../Source/Controller/Eeprom.c  .generated_files/flags/default__bootloaded_/881cd3ad5daa91f1253b036a468ce49b4bbb7732 .generated_files/flags/default__bootloaded_/99f3dccf676a45fa6804d5afac85c14b7050b57f
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Eeprom.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Eeprom.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Eeprom.o.d" -o ${OBJECTDIR}/_ext/1332549744/Eeprom.o ../../Source/Controller/Eeprom.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1332549744/Config.o: ../../Source/Controller/Config.c  .generated_files/flags/default__bootloaded_/93086277d5a65239b728b52b5845bc51075bad99 .generated_files/flags/default__bootloaded_/99f3dccf676a45fa6804d5afac85c14b7050b57f
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Config.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Config.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Config.o.d" -o ${OBJECTDIR}/_ext/1332549744/Config.o ../../Source/Controller/Config.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1332549744/Util.o: ../../Source/Controller/Util.c  .generated_files/flags/default__bootloaded_/18172b9fa1e7bac338fb9c273275742092a44f03 .generated_files/flags/default__bootloaded_/99f3dccf676a45fa6804d5afac85c14b7050b57f
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Util.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Util.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Util.o.d" -o ${OBJECTDIR}/_ext/1332549744/Util.o ../../Source/Controller/Util.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1332549744/Debug.o: ../../Source/Controller/Debug.c  .generated_files/flags/default__bootloaded_/b97f97670cd6110539935d5582b5d23bf5251716 .generated_files/flags/default__bootloaded_/99f3dccf676a45fa6804d5afac85c14b7050b57f
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Debug.o.d" -o ${OBJECTDIR}/_ext/1332549744/Debug.o ../../Source/Controller/Debug.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o: ../../Source/USB/Usb_HID_tasks_application.c  .generated_files/flags/default__bootloaded_/6d185af022339137c8b6598f1bbe879ef87f483d .generated_files/flags/default__bootloaded_/99f3dccf676a45fa6804d5afac85c14b7050b57f
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o.d" -o ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o ../../Source/USB/Usb_HID_tasks_application.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o: ../../Source/USB/usb_descriptors_app.c  .generated_files/flags/default__bootloaded_/c4a9f81a2b06410095f4fc56a16eec70d5ed2501 .generated_files/flags/default__bootloaded_/99f3dccf676a45fa6804d5afac85c14b7050b57f
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o ../../Source/USB/usb_descriptors_app.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/313519312/usb_device.o: ../../Source/USB/usb_device.c  .generated_files/flags/default__bootloaded_/20baaee673b3684113dba13bfcc131dfa68454e0 .generated_files/flags/default__bootloaded_/99f3dccf676a45fa6804d5afac85c14b7050b57f
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_device.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_device.o ../../Source/USB/usb_device.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/313519312/usb_function_hid.o: ../../Source/USB/usb_function_hid.c  .generated_files/flags/default__bootloaded_/787c61fc50db5ed6e6ed0e7c5e1b506026205300 .generated_files/flags/default__bootloaded_/99f3dccf676a45fa6804d5afac85c14b7050b57f
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_function_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_function_hid.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_function_hid.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_function_hid.o ../../Source/USB/usb_function_hid.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1787047461/Main.o: ../../Source/Main.c  .generated_files/flags/default__bootloaded_/2828997c15a2d67cac01bfc8c125541a426f4a4e .generated_files/flags/default__bootloaded_/99f3dccf676a45fa6804d5afac85c14b7050b57f
	@${MKDIR} "${OBJECTDIR}/_ext/1787047461" 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1787047461/Main.o.d" -o ${OBJECTDIR}/_ext/1787047461/Main.o ../../Source/Main.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1787047461/Exception.o: ../../Source/Exception.c  .generated_files/flags/default__bootloaded_/8faf972534a3eb51e26b773c062b7650e31d16a8 .generated_files/flags/default__bootloaded_/99f3dccf676a45fa6804d5afac85c14b7050b57f
	@${MKDIR} "${OBJECTDIR}/_ext/1787047461" 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Exception.o.d 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Exception.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1787047461/Exception.o.d" -o ${OBJECTDIR}/_ext/1787047461/Exception.o ../../Source/Exception.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
else
${OBJECTDIR}/_ext/1332549744/Lighting.o: ../../Source/Controller/Lighting.c  .generated_files/flags/default__bootloaded_/7ce826ceb3b696254663bea49da21bfbd06a1046 .generated_files/flags/default__bootloaded_/99f3dccf676a45fa6804d5afac85c14b7050b57f
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Lighting.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Lighting.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Lighting.o.d" -o ${OBJECTDIR}/_ext/1332549744/Lighting.o ../../Source/Controller/Lighting.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1332549744/Controller.o: ../../Source/Controller/Controller.c  .generated_files/flags/default__bootloaded_/c14ce42e795be61b1e1a25b2b706e9d8807438db .generated_files/flags/default__bootloaded_/99f3dccf676a45fa6804d5afac85c14b7050b57f
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Controller.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Controller.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Controller.o.d" -o ${OBJECTDIR}/_ext/1332549744/Controller.o ../../Source/Controller/Controller.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1332549744/Animation.o: ../../Source/Controller/Animation.c  .generated_files/flags/default__bootloaded_/3dd247f1313e0ec18d5ce6251d754f3b0e2eae49 .generated_files/flags/default__bootloaded_/99f3dccf676a45fa6804d5afac85c14b7050b57f
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Animation.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Animation.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Animation.o.d" -o ${OBJECTDIR}/_ext/1332549744/Animation.o ../../Source/Controller/Animation.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1332549744/Fan.o: ../../Source/Controller/Fan.c  .generated_files/flags/default__bootloaded_/f73df60e3f01a07fda548762e940e4b4a267068e .generated_files/flags/default__bootloaded_/99f3dccf676a45fa6804d5afac85c14b7050b57f
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Fan.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Fan.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Fan.o.d" -o ${OBJECTDIR}/_ext/1332549744/Fan.o ../../Source/Controller/Fan.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1332549744/Eeprom.o: ../../Source/Controller/Eeprom.c  .generated_files/flags/default__bootloaded_/6d61f72e11872553a88b7ababe7e979353b6d69b .generated_files/flags/default__bootloaded_/99f3dccf676a45fa6804d5afac85c14b7050b57f
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Eeprom.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Eeprom.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Eeprom.o.d" -o ${OBJECTDIR}/_ext/1332549744/Eeprom.o ../../Source/Controller/Eeprom.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1332549744/Config.o: ../../Source/Controller/Config.c  .generated_files/flags/default__bootloaded_/e3a0637bac7548d8316fcdc5549f3352fe9c4850 .generated_files/flags/default__bootloaded_/99f3dccf676a45fa6804d5afac85c14b7050b57f
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Config.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Config.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Config.o.d" -o ${OBJECTDIR}/_ext/1332549744/Config.o ../../Source/Controller/Config.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1332549744/Util.o: ../../Source/Controller/Util.c  .generated_files/flags/default__bootloaded_/d0ce54b721b1dd289fb9150644f0803e511461ad .generated_files/flags/default__bootloaded_/99f3dccf676a45fa6804d5afac85c14b7050b57f
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Util.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Util.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Util.o.d" -o ${OBJECTDIR}/_ext/1332549744/Util.o ../../Source/Controller/Util.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1332549744/Debug.o: ../../Source/Controller/Debug.c  .generated_files/flags/default__bootloaded_/a050748c200afaa86095e71b90e70828e12000f0 .generated_files/flags/default__bootloaded_/99f3dccf676a45fa6804d5afac85c14b7050b57f
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Debug.o.d" -o ${OBJECTDIR}/_ext/1332549744/Debug.o ../../Source/Controller/Debug.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o: ../../Source/USB/Usb_HID_tasks_application.c  .generated_files/flags/default__bootloaded_/8c5f3350a0579d7864fbf1064ad3443bf213e95a .generated_files/flags/default__bootloaded_/99f3dccf676a45fa6804d5afac85c14b7050b57f
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o.d" -o ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o ../../Source/USB/Usb_HID_tasks_application.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o: ../../Source/USB/usb_descriptors_app.c  .generated_files/flags/default__bootloaded_/eb419896953bc3a8eee6201d467f6a4f2304649d .generated_files/flags/default__bootloaded_/99f3dccf676a45fa6804d5afac85c14b7050b57f
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o ../../Source/USB/usb_descriptors_app.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/313519312/usb_device.o: ../../Source/USB/usb_device.c  .generated_files/flags/default__bootloaded_/7ff3d4a36167247222f266bccb0dfbcefca67a7 .generated_files/flags/default__bootloaded_/99f3dccf676a45fa6804d5afac85c14b7050b57f
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_device.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_device.o ../../Source/USB/usb_device.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/313519312/usb_function_hid.o: ../../Source/USB/usb_function_hid.c  .generated_files/flags/default__bootloaded_/677cfad5d377a1fccb5b9f582fe9146778af9793 .generated_files/flags/default__bootloaded_/99f3dccf676a45fa6804d5afac85c14b7050b57f
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_function_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_function_hid.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_function_hid.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_function_hid.o ../../Source/USB/usb_function_hid.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1787047461/Main.o: ../../Source/Main.c  .generated_files/flags/default__bootloaded_/5aef8c8d18a753ae0a1f3f88495d462bbd1d4c8c .generated_files/flags/default__bootloaded_/99f3dccf676a45fa6804d5afac85c14b7050b57f
	@${MKDIR} "${OBJECTDIR}/_ext/1787047461" 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1787047461/Main.o.d" -o ${OBJECTDIR}/_ext/1787047461/Main.o ../../Source/Main.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1787047461/Exception.o: ../../Source/Exception.c  .generated_files/flags/default__bootloaded_/f6e315855488a601998a838448a40795af8bea42 .generated_files/flags/default__bootloaded_/99f3dccf676a45fa6804d5afac85c14b7050b57f
	@${MKDIR} "${OBJECTDIR}/_ext/1787047461" 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Exception.o.d 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Exception.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1787047461/Exception.o.d" -o ${OBJECTDIR}/_ext/1787047461/Exception.o ../../Source/Exception.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Application.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../../linker_scripts/app_32MX230F064D.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -o dist/${CND_CONF}/${IMAGE_TYPE}/Application.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC00490:0x1FC00BEF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_PK3=1,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-L"../../MPLAB_Workspace",-Map="$(BINDIR_)$(TARGETBASE).map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Application.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../../linker_scripts/app_32MX230F064D.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -o dist/${CND_CONF}/${IMAGE_TYPE}/Application.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-L"../../MPLAB_Workspace",-Map="$(BINDIR_)$(TARGETBASE).map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml 
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Application.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default__bootloaded_
	${RM} -r dist/default__bootloaded_

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif

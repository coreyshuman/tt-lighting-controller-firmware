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
${OBJECTDIR}/_ext/1332549744/Lighting.o: ../../Source/Controller/Lighting.c  .generated_files/flags/standalone/aefb1d24d904fb88c9b645fccba3a66894fc4590 .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Lighting.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Lighting.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Lighting.o.d" -o ${OBJECTDIR}/_ext/1332549744/Lighting.o ../../Source/Controller/Lighting.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Controller.o: ../../Source/Controller/Controller.c  .generated_files/flags/standalone/9064c0d257cb4e5534e4584e8b7011d4e1eecf7d .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Controller.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Controller.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Controller.o.d" -o ${OBJECTDIR}/_ext/1332549744/Controller.o ../../Source/Controller/Controller.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Animation.o: ../../Source/Controller/Animation.c  .generated_files/flags/standalone/35ce1f029a126d55ac154d7e45f5fde1d8bfeead .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Animation.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Animation.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Animation.o.d" -o ${OBJECTDIR}/_ext/1332549744/Animation.o ../../Source/Controller/Animation.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Fan.o: ../../Source/Controller/Fan.c  .generated_files/flags/standalone/7b46a16405b19dbb8966103fce8ec1e1d84cf96a .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Fan.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Fan.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Fan.o.d" -o ${OBJECTDIR}/_ext/1332549744/Fan.o ../../Source/Controller/Fan.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Eeprom.o: ../../Source/Controller/Eeprom.c  .generated_files/flags/standalone/9b3b7fee4a983f566c54a62c0e5d7a45d668fff3 .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Eeprom.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Eeprom.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Eeprom.o.d" -o ${OBJECTDIR}/_ext/1332549744/Eeprom.o ../../Source/Controller/Eeprom.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Config.o: ../../Source/Controller/Config.c  .generated_files/flags/standalone/9a1b6492398c6d2b643ada429da7ec79f4b7a2e8 .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Config.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Config.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Config.o.d" -o ${OBJECTDIR}/_ext/1332549744/Config.o ../../Source/Controller/Config.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Util.o: ../../Source/Controller/Util.c  .generated_files/flags/standalone/c0a068dd40459947e805a1553368b4ed4c1e1c8 .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Util.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Util.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Util.o.d" -o ${OBJECTDIR}/_ext/1332549744/Util.o ../../Source/Controller/Util.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Debug.o: ../../Source/Controller/Debug.c  .generated_files/flags/standalone/1d1216cf773ee5e1438fc289c8377d1c004e2345 .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Debug.o.d" -o ${OBJECTDIR}/_ext/1332549744/Debug.o ../../Source/Controller/Debug.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o: ../../Source/USB/Usb_HID_tasks_application.c  .generated_files/flags/standalone/32aae2983ace217aace2da9fc19032dafc9f31cd .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o.d" -o ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o ../../Source/USB/Usb_HID_tasks_application.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o: ../../Source/USB/usb_descriptors_app.c  .generated_files/flags/standalone/aaed0a473ff4c686c184b870a3ef0fe038f9f8e .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o ../../Source/USB/usb_descriptors_app.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/313519312/usb_device.o: ../../Source/USB/usb_device.c  .generated_files/flags/standalone/a14ee0d8eaa27b6343b6fa5425d6709e2c45d16f .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_device.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_device.o ../../Source/USB/usb_device.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/313519312/usb_function_hid.o: ../../Source/USB/usb_function_hid.c  .generated_files/flags/standalone/26752023e587897cda933fb4e46d23602a800532 .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_function_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_function_hid.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_function_hid.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_function_hid.o ../../Source/USB/usb_function_hid.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1787047461/Main.o: ../../Source/Main.c  .generated_files/flags/standalone/4e007db5f2c5a1bafc8ac503132be4ab950f043b .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1787047461" 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1787047461/Main.o.d" -o ${OBJECTDIR}/_ext/1787047461/Main.o ../../Source/Main.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1787047461/Exception.o: ../../Source/Exception.c  .generated_files/flags/standalone/fdb85715755b4f0e34d53b5231ade40b3731fdf4 .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1787047461" 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Exception.o.d 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Exception.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1787047461/Exception.o.d" -o ${OBJECTDIR}/_ext/1787047461/Exception.o ../../Source/Exception.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/1332549744/Lighting.o: ../../Source/Controller/Lighting.c  .generated_files/flags/standalone/a4055e33dbab10e000d262bfa1f862666f4c8d84 .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Lighting.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Lighting.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Lighting.o.d" -o ${OBJECTDIR}/_ext/1332549744/Lighting.o ../../Source/Controller/Lighting.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Controller.o: ../../Source/Controller/Controller.c  .generated_files/flags/standalone/9f45f7b400dd093fd46c507bcca26457b5540dec .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Controller.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Controller.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Controller.o.d" -o ${OBJECTDIR}/_ext/1332549744/Controller.o ../../Source/Controller/Controller.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Animation.o: ../../Source/Controller/Animation.c  .generated_files/flags/standalone/b74a36895169442b6cca490a284a497623c2bf9a .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Animation.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Animation.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Animation.o.d" -o ${OBJECTDIR}/_ext/1332549744/Animation.o ../../Source/Controller/Animation.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Fan.o: ../../Source/Controller/Fan.c  .generated_files/flags/standalone/df82f8420a209c7cd64d34ac4820247f828584ca .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Fan.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Fan.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Fan.o.d" -o ${OBJECTDIR}/_ext/1332549744/Fan.o ../../Source/Controller/Fan.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Eeprom.o: ../../Source/Controller/Eeprom.c  .generated_files/flags/standalone/a7e40f7db8d97a8426172318682136c30a6bbda0 .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Eeprom.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Eeprom.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Eeprom.o.d" -o ${OBJECTDIR}/_ext/1332549744/Eeprom.o ../../Source/Controller/Eeprom.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Config.o: ../../Source/Controller/Config.c  .generated_files/flags/standalone/272f236f84ba358fa5990c70509f1e5555cef506 .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Config.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Config.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Config.o.d" -o ${OBJECTDIR}/_ext/1332549744/Config.o ../../Source/Controller/Config.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Util.o: ../../Source/Controller/Util.c  .generated_files/flags/standalone/ef4d54efa2421a2c0cfaf9cbd50276ece33c348d .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Util.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Util.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Util.o.d" -o ${OBJECTDIR}/_ext/1332549744/Util.o ../../Source/Controller/Util.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Debug.o: ../../Source/Controller/Debug.c  .generated_files/flags/standalone/963e979e73d7395a2e99a6f57550df1958a2ecb5 .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Debug.o.d" -o ${OBJECTDIR}/_ext/1332549744/Debug.o ../../Source/Controller/Debug.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o: ../../Source/USB/Usb_HID_tasks_application.c  .generated_files/flags/standalone/5ce6d4b33e68e6f3c6c6776b1363325e1d4f9283 .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o.d" -o ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o ../../Source/USB/Usb_HID_tasks_application.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o: ../../Source/USB/usb_descriptors_app.c  .generated_files/flags/standalone/554b4ac105ec2bb09994d6d52b4018326f4fa31b .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o ../../Source/USB/usb_descriptors_app.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/313519312/usb_device.o: ../../Source/USB/usb_device.c  .generated_files/flags/standalone/5c1cd8c910579b06cff30d4eeea831d934420d76 .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_device.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_device.o ../../Source/USB/usb_device.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/313519312/usb_function_hid.o: ../../Source/USB/usb_function_hid.c  .generated_files/flags/standalone/ccc9843a8d245013d80fb21e389bbbdd418f6cec .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_function_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_function_hid.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_function_hid.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_function_hid.o ../../Source/USB/usb_function_hid.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1787047461/Main.o: ../../Source/Main.c  .generated_files/flags/standalone/4fbbddd6bb5c3ac1b66dbf64875a3f067971cc5d .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1787047461" 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1787047461/Main.o.d" -o ${OBJECTDIR}/_ext/1787047461/Main.o ../../Source/Main.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1787047461/Exception.o: ../../Source/Exception.c  .generated_files/flags/standalone/de58143f92e4278f29f22e5e2d31aa1dc890a3ce .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1787047461" 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Exception.o.d 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Exception.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1787047461/Exception.o.d" -o ${OBJECTDIR}/_ext/1787047461/Exception.o ../../Source/Exception.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Application.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../../linker_scripts/app_32MX230F064D_standalone.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Application.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC00490:0x1FC00BEF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_PK3=1,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-L"../../MPLAB_Workspace",-Map="$(BINDIR_)$(TARGETBASE).map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Application.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../../linker_scripts/app_32MX230F064D_standalone.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Application.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-L"../../MPLAB_Workspace",-Map="$(BINDIR_)$(TARGETBASE).map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
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

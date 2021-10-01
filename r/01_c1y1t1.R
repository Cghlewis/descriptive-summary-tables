

source("functions.R")

# -------------------------- Student Level Documentation ----------------------

# ------------------------------- Read in Data ----------------------------

# Remove T# to make variables easier to call

# Read in data

Data <- haven::read_sav("c1y1t1_student_2021-06-21.sav")  %>%
  rename_all(~ (str_replace(., "T._", "")))


# -------------------- Toca Concentration Problems (7 items) --------------


# Make a Data frame of only variables in this measure

tocacon_dat <- fMeasuredf(Data, tocacon)

# Calculate omega and make df

tocacon_om <- fOmega(tocacon_dat)

# Calculate alpha and make df

tocacon_al <- fAlpha(tocacon_dat)


# Calculate descriptives on sum and mean score and make long df

tocacon_des <- fDescriptives(Data$toca_ConcenProb_Sum, Data$toca_ConcenProb_Mean)


# Bind all stats and rename to correct time period

TocaConProbC1Y1T1 <- fBind(tocacon_des, tocacon_om, tocacon_al) %>%
  rename(C1Y1T1 = "Time")

# Remove extra dfs

rm(tocacon_dat, tocacon_om, tocacon_al, tocacon_des)


# --------------------- Toca Disruptive Behavior (9 items)------------

# Make a Data frame of only variables in this measure

tocadis_dat <- fMeasuredf (Data, tocadis)

# Calculate omega and make df

tocadis_om <- fOmega(tocadis_dat)

# Calculate alpha and make df

tocadis_al <- fAlpha(tocadis_dat)


# Calculate descriptives on sum and mean score and make long df

tocadis_des <- fDescriptives(Data$toca_DisrBeh_Sum, Data$toca_DisrBeh_Mean)


# Bind all stats and rename to correct time period

TocaDisrBehC1Y1T1 <- fBind(tocadis_des, tocadis_om, tocadis_al) %>%
  rename(C1Y1T1 = "Time")

# Remove extra dfs

rm(tocadis_dat, tocadis_om, tocadis_al, tocadis_des)


# --------------------- Toca Prosocial (5 items)------------

# Make a Data frame of only variables in this measure

tocapro_dat <- fMeasuredf (Data, tocapro)

# Calculate omega and make df

tocapro_om <- fOmega(tocapro_dat)

# Calculate alpha and make df

tocapro_al <- fAlpha(tocapro_dat)

# Calculate descriptives on sum and mean score and make long df

tocapro_des <- fDescriptives(Data$toca_ProSoc_Sum, Data$toca_ProSoc_Mean)


# Bind all stats and rename to correct time period

TocaProSocC1Y1T1 <- fBind(tocapro_des, tocapro_om, tocapro_al) %>%
  rename(C1Y1T1 = "Time")

# Remove extra dfs

rm(tocapro_dat, tocapro_om, tocapro_al, tocapro_des)

# --------------------- Toca Emotion Dysregulation (5 items)------------

# Make a Data frame of only variables in this measure

tocaemo_dat <- fMeasuredf(Data, tocaemo)

# Calculate omega and make df

tocaemo_om <- fOmega(tocaemo_dat)


# Calculate alpha and make df

tocaemo_al <- fAlpha(tocaemo_dat)


# Calculate descriptives on sum and mean scores and make long df

tocaemo_des <- fDescriptives(Data$toca_EmotDys_Sum, Data$toca_EmotDys_Mean)


# Bind all stats and rename to correct time period

TocaEmotDysC1Y1T1 <- fBind(tocaemo_des, tocaemo_om, tocaemo_al) %>%
  rename(C1Y1T1 = "Time")

# Remove extra dfs

rm(tocaemo_dat, tocaemo_om, tocaemo_al, tocaemo_des)


# --------------------- Toca Internal (5 items)------------

# Make a Data frame of only variables in this measure

tocaint_dat <- fMeasuredf(Data, tocaint)

# Calculate omega and make into a df

tocaint_om <- fOmega(tocaint_dat)


# Calculate alpha and make into a df

tocaint_al <- fAlpha(tocaint_dat)


# Calculate descriptives on sum and mean scores and make long df

tocaint_des <- fDescriptives(Data$toca_Internal_Sum, Data$toca_Internal_Mean)


# Bind all stats and rename to correct time period

TocaInternalC1Y1T1 <- fBind(tocaint_des, tocaint_om, tocaint_al) %>%
  rename(C1Y1T1 = "Time")

# Remove extra dfs

rm(tocaint_dat, tocaint_om, tocaint_al, tocaint_des)


# --------------------- Toca Family Problem (3 items)------------

# Make a Data frame of only variables in this measure

tocafprob_dat <- fMeasuredf(Data, tocafprob)

# Calculate omega 

tocafprob_om <- fOmega(tocafprob_dat)


# Calculate alpha

tocafprob_al <- fAlpha(tocafprob_dat)


# Calculate descriptives on sum and mean scores and make long df

tocafprob_des <- fDescriptives(Data$toca_FamProb_Sum, Data$toca_FamProb_Mean)


# Bind all stats and rename to correct time period

TocaFamProbC1Y1T1 <- fBind(tocafprob_des, tocafprob_om, tocafprob_al) %>%
  rename(C1Y1T1 = "Time")

# Remove extra dfs

rm(tocafprob_dat, tocafprob_om, tocafprob_al, tocafprob_des)


# --------------------- Toca Family Involvement (5 items)------------

# Make a Data frame of only variables in this measure

tocafinv_dat <- fMeasuredf(Data, tocafinv)

# Calculate omega and make df

tocafinv_om <- fOmega(tocafinv_dat)

# Calculate alpha and make df

tocafinv_al <- fAlpha(tocafinv_dat)


# Calculate descriptives on sum and mean scores and make long df

tocafinv_des <- fDescriptives(Data$toca_FamInvlv_Sum, Data$toca_FamInvlv_Mean)


# Bind all stats and rename to correct time period

TocaFamInvlvC1Y1T1 <- fBind(tocafinv_des, tocafinv_om, tocafinv_al) %>%
  rename(C1Y1T1 = "Time")

# Remove extra dfs

rm(tocafinv_dat, tocafinv_om, tocafinv_al, tocafinv_des)


# --------------------- T-COMP Prosocial Behavior (5 items)------------

# Make a Data frame of only variables in this measure

tcomppro_dat <- fMeasuredf(Data, tcomppro)

# Calculate omega and make df

tcomppro_om <- fOmega(tcomppro_dat)


# Calculate alpha and make df

tcomppro_al <- fAlpha(tcomppro_dat)


# Calculate descriptives on sum and mean scores and make long df

tcomppro_des <- fDescriptives(Data$compprosoc_Sum, Data$compprosoc_Mean)


# Bind all stats and rename to correct time period

CompProSocC1Y1T1 <- fBind(tcomppro_des, tcomppro_om, tcomppro_al) %>%
  rename(C1Y1T1 = "Time")

# Remove extra dfs

rm(tcomppro_dat, tcomppro_om, tcomppro_al, tcomppro_des)


# --------------------- T-COMP emotion regulation (7 items)------------

# Make a Data frame of only variables in this measure

tcompemo_dat <- fMeasuredf(Data, tcompemo)

# Calculate omega and make df

tcompemo_om <- fOmega(tcompemo_dat)


# Calculate alpha and make df

tcompemo_al <- fAlpha(tcompemo_dat)


# Calculate descriptives on sum and mean scores and make long df

tcompemo_des <- fDescriptives(Data$compemoreg_Sum, Data$compemoreg_Mean)


# Bind all stats and rename to correct time period

CompEmoRegC1Y1T1 <- fBind(tcompemo_des, tcompemo_om, tcompemo_al) %>%
  rename(C1Y1T1 = "Time")

# Remove extra dfs

rm(tcompemo_dat, tcompemo_om, tcompemo_al, tcompemo_des)


# --------------------- T-COMP academic competence (5 items)------------

# Make a Data frame of only variables in this measure

tcompacad_dat <- fMeasuredf(Data, tcompacad)

# Calculate omega and make df

tcompacad_om <- fOmega(tcompacad_dat)


# Calculate alpha and make df

tcompacad_al <- fAlpha(tcompacad_dat)


# Calculate descriptives on sum and mean scores and make long df

tcompacad_des <- fDescriptives(Data$compacad_Sum, Data$compacad_Mean)


# Bind all stats and rename to correct time period

CompAcadC1Y1T1 <- fBind(tcompacad_des, tcompacad_om, tcompacad_al) %>%
  rename(C1Y1T1 = "Time")

# Remove extra dfs

rm(tcompacad_dat, tcompacad_om, tcompacad_al, tcompacad_des)


# ---------------------  T-COMP - total scale mean  (17 items)------------

# Make a Data frame of only variables in this measure

tcomptot_dat <- fMeasuredf(Data, tcomptot)

# Calculate omega and make df

tcomptot_om <- fOmega(tcomptot_dat)


# Calculate alpha and make df

tcomptot_al <- fAlpha(tcomptot_dat)


# Calculate descriptives on sum and mean scores and make long df

tcomptot_des <- fDescriptives(Data$comptot_Sum, Data$comptot_Mean)


# Bind all stats and rename to correct time period

CompTotC1Y1T1 <- fBind(tcomptot_des, tcomptot_om, tcomptot_al) %>%
  rename(C1Y1T1 = "Time")

# Remove extra dfs

rm(tcomptot_dat, tcomptot_om, tcomptot_al, tcomptot_des)

# Remove main data ------------------------------------------------------------

rm(Data)

# -------------------------- Teacher Level Documentation ----------------------

# ------------------------------- Read in Data ----------------------------

# Remove T# to make variables easier to call

# Read in data

Data <- haven::read_sav("c1y1t1_teacher_2021-06-10.sav")  %>%
  rename_all(~ (str_replace(., "T._", "")))


# -------------------- Classroom Management (8 items) --------------


# Make a Data frame of only variables in this measure

effic_dat <- fMeasuredf(Data, effic)

# Calculate omega and make df

effic_om <- fOmega(effic_dat)


# Calculate alpha and make df

effic_al <- fAlpha(effic_dat)


# Calculate descriptives on sum and mean scores and make long df

effic_des <- fDescriptives(Data$effic_Sum, Data$effic_Mean)


# Bind all stats and rename to correct time period

EfficC1Y1T1 <- fBind(effic_des, effic_om, effic_al) %>%
  rename(C1Y1T1 = "Time")

# Remove extra dfs

rm(effic_dat, effic_om, effic_al, effic_des)


# -------------------- Emotional Exhaustion (4 items) --------------

# Make a Data frame of only variables in this measure

mbi_dat <- fMeasuredf(Data, mbi)

# Calculate omega and make df

mbi_om <- fOmega(mbi_dat)


# Calculate alpha and make df

mbi_al <- fAlpha(mbi_dat)


# Calculate descriptives on sum and mean scores and make long df

mbi_des <- fDescriptives(Data$mbiee_Sum, Data$mbiee_Mean)


# Bind all stats and rename to correct time period

MBIC1Y1T1 <- fBind(mbi_des, mbi_om, mbi_al) %>%
  rename(C1Y1T1 = "Time")

# Remove extra dfs

rm(mbi_dat, mbi_om, mbi_al, mbi_des)

# Remove main data ---------------------------------------------------

rm(Data)


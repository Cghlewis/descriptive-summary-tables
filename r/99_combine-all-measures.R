

source("functions.R")

# Make all time points per measure into a list --------------------------------------------------

TocaConlist <- lapply(ls(pattern="TocaConProbC"), get) # 'get' gets the value of an object based on its name
# lapply returns a list, sapply returns a vector
# ls names objects in the environment

TocaDislist <- lapply(ls(pattern="TocaDisrBehC"), get)

TocaProlist <- lapply(ls(pattern="TocaProSocC"), get)

TocaEmolist <- lapply(ls(pattern="TocaEmotDysC"), get)

TocaIntlist <- lapply(ls(pattern="TocaInternalC"), get)

TocaFamProblist <- lapply(ls(pattern="TocaFamProbC"), get)

TocaFamInvlist <- lapply(ls(pattern="TocaFamInvlvC"), get)

TCompProlist <- lapply(ls(pattern="CompProSocC"), get)

TCompEmoReglist <- lapply(ls(pattern="CompEmoRegC"), get)

TCompAcadlist <- lapply(ls(pattern="CompAcadC"), get)

TCompTotlist <- lapply(ls(pattern="CompTotC"), get)

Efficlist <- lapply(ls(pattern="EfficC"), get)

MBIlist <- lapply(ls(pattern="MBIC"), get)


# Merge same measures across time --------------------------------------------------------

# Toca

TocaConAll <- fMergeAll(TocaConlist) 
TocaDisAll <- fMergeAll(TocaDislist)
TocaProAll <- fMergeAll(TocaProlist)
TocaEmoAll <- fMergeAll(TocaEmolist)
TocaIntAll <- fMergeAll(TocaIntlist)
TocaFamProbAll <- fMergeAll(TocaFamProblist)
TocaFamInvAll <- fMergeAll(TocaFamInvlist)

# TComp

TCompProAll <- fMergeAll(TCompProlist)
TCompEmoRegAll <- fMergeAll(TCompEmoReglist)
TCompAcadAll <- fMergeAll(TCompAcadlist)
TCompTotAll <- fMergeAll(TCompTotlist)

# Efficacy

EfficAll <- fMergeAll(Efficlist)

# MBI

MBIAll <- fMergeAll(MBIlist)


# Export all tables --------------------------------------------------------------------

# Make dfs into tables with titles

TocaConTab <- TocaConAll %>% expss::set_caption("Toca Concentration Problems (7 items)")
TocaDisTab <- TocaDisAll %>% expss::set_caption("Toca Disruptive Behavior (9 items)")
TocaProTab <- TocaProAll %>% expss::set_caption("Toca Prosocial Behavior (5 items)")
TocaEmoTab <- TocaEmoAll %>% expss::set_caption("Toca Emotion Dysregulation (5 items)")
TocaIntTab <- TocaIntAll %>% expss::set_caption("Toca Internalizing (5 items)")
TocaFamProbTab <- TocaFamProbAll %>% expss::set_caption("Toca Family Problems (3 items)")
TocaFamInvTab <- TocaFamInvAll %>% expss::set_caption("Toca Family Involvement (5 items)")

TCompProTab <- TCompProAll  %>% expss::set_caption("T-Comp Prosocial Behavior (5 items)")
TCompEmoRegTab <- TCompEmoRegAll  %>% expss::set_caption("T-Comp Emotion Regulation (7 items)")
TCompAcadTab <- TCompAcadAll  %>% expss::set_caption("T-Comp Academic Competence (5 items)")
TCompTotTab <- TCompTotAll %>% expss::set_caption ("T-Comp Total Scale (17 items)")

EfficTab <- EfficAll %>% expss::set_caption("Classroom Management (8 items)")
MBITab <- MBIAll %>% expss::set_caption("Emotional Exhaustion (4 items)")


# Make lists of measure subscales to go on same tab of workbook -------------------------

TocaTab <- list(TocaConTab, TocaDisTab, TocaProTab, TocaEmoTab, TocaIntTab, TocaFamProbTab,
             TocaFamInvTab)

EngDisTab <- list(bEngTab, eEngTab, bDisTab, eDisTab)

SelfEffTab <- list(SelfEffovTab, SelfEffsubTab, SelfEffworkTab)

TCompTab <- list(TCompProTab, TCompEmoRegTab, TCompAcadTab, TCompTotTab)

StoicTab <- list(StoicStTab, StoicTeachTab, StoicObsTab, StoicIntTab, StoicCorTab, StoicOvTab)

# Make workbook and add sheets/tabs --------------------------------------------

# S_ are student measures
# T_ are teacher measures

wb = openxlsx::createWorkbook()

sheet1= openxlsx::addWorksheet(wb, "S_Toca")
sheet7= openxlsx::addWorksheet(wb, "S_TComp")
sheet8= openxlsx::addWorksheet(wb, "T_Effic")
sheet9= openxlsx::addWorksheet(wb, "T_MBI")

# Add styles -----------------------------------------------------------

style1 <- openxlsx::createStyle(fgFill="gray", border="TopBottomLeftRight", halign ="center")
style2 <- openxlsx::createStyle(fgFill="gray92", border="TopBottomLeftRight", halign ="center")
style3 <- openxlsx::createStyle(border="TopBottomLeftRight", halign ="center")

# Toca styles 

openxlsx::addStyle(wb, "S_Toca", rows = c(8:12, 23:27, 38:42, 53:57, 68:72, 83:87, 98:102),
                   cols= 1:20, style=style2, gridExpand = T)
openxlsx::addStyle(wb, "S_Toca", rows = c(13:14, 28:29, 43:44, 58:59, 73:74, 88:89, 103:104),
                   cols= 1:20, style=style1, gridExpand = T)
openxlsx::addStyle(wb, "S_Toca", rows=c(2:7, 17:22, 32:37, 47:52, 62:67, 77:82, 92:97),
                   cols=1:20, style=style3, gridExpand = T)


# TComp Styles

openxlsx::addStyle(wb, "S_TComp", rows = c(8:12, 23:27, 38:42, 53:57),
                   cols= 1:20, style=style2, gridExpand = T)

openxlsx::addStyle(wb, "S_TComp", rows = c(13:14, 28:29, 43:44, 58:59),
                   cols= 1:20, style=style1, gridExpand = T)

openxlsx::addStyle(wb, "S_TComp", rows=c(2:7, 17:22, 32:37, 47:52),
                   cols=1:20, style=style3, gridExpand = T)



# MBI and Efficacy styles

sheet_names <- c("T_MBI", "T_Effic")

purrr::walk2(sheet_names, 1, ~openxlsx::addStyle(wb, .x, 
                                                 style = style2, 
                                                 rows = 8:12, cols = 1:20, gridExpand = T))

purrr::walk2(sheet_names, 1, ~openxlsx::addStyle(wb, .x, 
                                                 style = style1, 
                                                 rows = 13:14, cols = 1:20, gridExpand = T))

purrr::walk2(sheet_names, 1, ~openxlsx::addStyle(wb, .x, 
                                                 style = style3, 
                                                 rows = 2:7, cols = 1:20, gridExpand = T))


# Write data to sheets

expss::xl_write(TocaTab, wb, sheet1)
expss::xl_write(TCompTab, wb, sheet7)
expss::xl_write(EfficTab, wb, sheet8)
expss::xl_write(MBITab, wb, sheet9)


# Export tables

openxlsx::saveWorkbook(wb, "project_descriptives_2021-10-01.xlsx", overwrite=TRUE)

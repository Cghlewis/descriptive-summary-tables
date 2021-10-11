
# Libraries ---------------------------------------------------------------

library(tidyverse)
library(coefficientalpha)
library(psych)
library(expss)
library(purrr)


# ---------------------------- Measure Functions ------------------------

# Create a data frame including the variables for one measure

fMeasuredf <- function(data, vars){
  data %>%
    dplyr::select(all_of(vars)) %>%
    expss::drop_empty_rows()
}

# -------------------------------- Global Functions -----------------------

# Create a data frame of omega for a measure

fOmega <- function (measuredf) {

  omegastat <- coefficientalpha::omega(measuredf, varphi=0, test=FALSE)

  as.data.frame(omegastat$omega) %>%
    setNames("Time") %>%
    mutate(Stat = "omega")
}

# Create a data frame of alpha for a measure

fAlpha <- function (measuredf) {

  alphastat <- coefficientalpha::alpha(measuredf, varphi=0, test=FALSE)

  as.data.frame(alphastat$alpha) %>%
    setNames("Time") %>%
    mutate(Stat = "alpha")
}

# Create a data frame of descriptives of sum and mean scores for a measure (describe default is na.rm = TRUE)

fDescriptives <- function (sum, mean) {

  fDesSum <- psych::describe(sum) %>%
    dplyr::select("n (sum score)"=n, "mean (sum score)"=mean, "sd (sum score)"=sd, "min (sum score)"=min,
                  "max (sum score)"=max)

  fDesMean <- psych::describe(mean) %>%
    dplyr::select("n (mean score)"=n, "mean (mean score)"=mean, "sd (mean score)"=sd, "min (mean score)"=min,
                  "max (mean score)"=max)

  bind_cols(fDesSum, fDesMean) %>%
    tidyr::pivot_longer(everything(), names_to ="Stat") %>%
    dplyr::rename(Time = value)
}

# Bind descriptives with alpha and omega

fBind <- function(descriptivedf,omegadf,alphadf){
  descriptivedf %>%
    dplyr::bind_rows(omegadf, alphadf) %>%
    dplyr::mutate(Time=round(Time,2))
}

# Merge measures together across time and reorganize rows

fMergeAll <- function(list) {
  purrr::reduce(list, merge) %>%
    dplyr::mutate(Stat=forcats::fct_relevel(Stat,"n (sum score)", "mean (sum score)", "sd (sum score)",
                                            "min (sum score)", "max (sum score)", "n (mean score)", "mean (mean score)",
                                            "sd (mean score)", "min (mean score)", "max (mean score)","omega", "alpha")) %>%
    arrange(Stat)
}



# -------------------------- Measures ---------------------------------------

# Student measures

tocacon <- c("toca1", "toca4", "toca9", "toca13", "toca15", "toca23", "toca25")
tocadis <- c("toca5", "toca8", "toca10", "toca12", "toca14", "toca18", "toca20",
             "toca22", "toca24")
tocapro <- c("toca2" , "toca7" , "toca11" , "toca16" , "toca21")
tocaemo <- c("toca6" , "toca29" , "toca31" , "toca35" , "toca36")
tocaint <- c("toca27" , "toca30" , "toca32" , "toca34", "toca39")
tocafprob <- c("toca28" , "toca33" , "toca37")
tocafinv <- c("toca41" , "toca42" , "toca43" , "toca44" , "toca45")

tcomppro <- c("prosocial1" , "prosocial2" , "prosocial3" , "prosocial4" , "prosocial5")
tcompemo <- c("emoreg1" , "emoreg2" , "emoreg3" , "emoreg4", "emoreg5", "emoreg6", "emoreg7")
tcompacad <- c("academic1" , "academic2", "academic3" , "academic4" , "academic5")
tcomptot <- c("prosocial1" , "prosocial2" , "prosocial3" , "prosocial4" , "prosocial5",
              "emoreg1" , "emoreg2" , "emoreg3" , "emoreg4", "emoreg5", "emoreg6", "emoreg7",
              "academic1" , "academic2", "academic3" , "academic4" , "academic5")

# Teacher measures

effic <- c("effic1" , "effic2" , "effic3" , "effic4" , "effic5" , "effic6" , "effic7" , "effic8")

mbi <- c("mbi1" , "mbi2" , "mbi3" , "mbi4")


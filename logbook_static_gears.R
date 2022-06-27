#' Logbook data from the ICES VMS and Logbook Database
#'
#' Logbook data from the ICES VMS and Logbook Database
#' for static gears only, from the 2021 datacall
#'
#' @name logbook_static_gears
#' @format csv file
#' @tafOriginator ICES
#' @tafYear 2021
#' @tafAccess Restricted
#' @tafSource script

library(icesTAF)
library(icesVMS)
library(icesVocab)

# get static gear data
static_gears <-
  list(
    "Active_lines" = c("LHP", "LHM", "LTL", "LVT"),
    "Passive_lines" = c("LLS", "LLD", "LL", "LX"),
    "Nets" = c("GNS", "GND", "GNC", "GTR", "GTN", "GEN"),
    "Traps" = c("FPN", "FPO", "FYK")
  )

# download
# note to access download a token for the current R session using
# update_token({ices username})

# to get all years (year = 0)
logbook_static <-
  get_logbook(
    gear_code = unlist(static_gears), year = 0, datacall = 2021
  )

# save
write.taf(logbook_static, quote = TRUE)

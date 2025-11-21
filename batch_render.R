# Lecture slides
options(warn = 2)

install_all_packages <- TRUE

if (install_all_packages) {
  if (!require("pak", quietly = TRUE)) {
    install.packages("pak")
  }

  pak::pak(c(
    "tidyverse",
    "readxl",
    "broom",
    "cowplot",
    "viridis",
    "wesanderson",
    "ggsci",
    "latex2exp",
    "ggtext",
    "ggrepel",
    "ggforce",
    "ggridges",
    "ggflowchart",
    "ggpubr",
    "plotly",
    "GGally",
    "patchwork",
    "magick",
    "see",
    "lmtest",
    "car",
    "glmmTMB",
    "performance",
    "multcomp",
    "effectsize",
    "AICcmodavg",
    "bayesplot",
    "posterior",
    "pwr",
    "ICC",
    "DescTools",
    "cvTools",
    "epiDisplay",
    "Rmpfr",
    "smatr",
    "factoextra",
    "mvtnorm",
    "ape",
    "phytools",
    "sf",
    "rnaturalearth",
    "rnaturalearthdata",
    "knitr",
    "gt",
    "sjPlot",
    "pander",
    "tictoc",
    "furrr",
    "paletteer"
  ))

  pak::pkg_install("stan-dev/cmdstanr")
  pak::pkg_install("rmcelreath/rethinking")

  if (!require("BiocManager", quietly = TRUE)) {
    install.packages("BiocManager")
  }

  BiocManager::install("qvalue")
  BiocManager::install("ggtree")
}


qmds <- list.files(
  pattern = "^[0-9]*-[1-6].*qmd$",
  path = "Lectures/",
  full.names = TRUE
)

for (qq in qmds) {
  message("Processing ", qq)
  syscall <- paste0("quarto render ", qq, " --to revealjs")
  system(syscall)
}

## Problem sets

qmds <- list.files(
  pattern = "^PS_[0-9]*[_Key]*.qmd$",
  path = "Problem_Sets",
  full.names = TRUE
)

for (qq in qmds) {
  message("Processing ", qq)
  syscall <- paste0("quarto render ", qq, " --to html")
  system(syscall)
}

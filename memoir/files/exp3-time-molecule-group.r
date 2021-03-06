#!/usr/bin/env Rscript
setwd("./files/")
source("Rinit")
out.file.boxplot = get.outname(commandArgs())

dat.binome = dat.exp3[ dat.exp3$group.number == 2, ]
bp.binome = boxplot(dat.binome$time.completion~dat.binome$molecule, plot=FALSE)
colnames(bp.binome$stats) = c("\\myscenario{1}","\\myscenario{2}")
write.table(bp.binome$stats,
			file = out.file.boxplot,
			quote = FALSE,
			sep = ",",
			eol = "\n",
			dec = ".",
			row.names = FALSE,
			col.names = TRUE)
dat.quadrinome = dat.exp3[dat.exp3$group.number == 4, ]
bp.quadrinome = boxplot(dat.quadrinome$time.completion~dat.quadrinome$molecule, plot=FALSE)
write.table(bp.quadrinome$stats,
			file = out.file.boxplot,
			quote = FALSE,
			sep = ",",
			eol = "\n",
			dec = ".",
			row.names = FALSE,
			col.names = FALSE,
			append = TRUE)

dat.prion = dat.exp3[ dat.exp3$molecule == "prion", ]
shapiro = shapiro.test(dat.prion$time.completion)
levene = levene.test(dat.prion$time.completion, dat.prion$group.number)
grp1 = dat.prion[ dat.prion$group.number == 2, ]$time.completion
grp2 = dat.prion[ dat.prion$group.number == 4, ]$time.completion
grp = cbind(grp1, grp2)
friedman = friedman.test(grp)
out.anova = friedman2tex(friedman)
out.file.anova = gsub(".csv", "-anova-prion.tex", out.file.boxplot)
write(
	  out.anova,
	  file = out.file.anova
	  )

dat.ubiquitin = dat.exp3[ dat.exp3$molecule == "ubiquitin", ]
shapiro = shapiro.test(dat.ubiquitin$time.completion)
levene = levene.test(dat.ubiquitin$time.completion, dat.ubiquitin$group.number)
grp1 = dat.ubiquitin[ dat.ubiquitin$group.number == 2, ]$time.completion
grp2 = dat.ubiquitin[ dat.ubiquitin$group.number == 4, ]$time.completion
grp = cbind(grp1, grp2)
friedman = friedman.test(grp)
out.anova = friedman2tex(friedman)
out.file.anova = gsub(".csv", "-anova-ubiquitin.tex", out.file.boxplot)
write(
	  out.anova,
	  file = out.file.anova
	  )

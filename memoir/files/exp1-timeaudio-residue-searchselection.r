#!/usr/bin/env Rscript
setwd("./files/")
source("Rinit")
out.file.boxplot = get.outname(commandArgs())

dat.exp1 = dat.exp1[dat.exp1$group.number == 2,]
bp.audio.search = boxplot(dat.exp1$time.search.audio~dat.exp1$pattern.number, plot=FALSE)
#dat.exp1$time.search.audio = boxplot.filter(dat.exp1$time.search.audio, bp.audio.search$out)
colnames(bp.audio.search$stats) = c("\\myresidue{1}","\\myresidue{2}","\\myresidue{3}","\\myresidue{4}","\\myresidue{5}","\\myresidue{6}","\\myresidue{7}","\\myresidue{8}","\\myresidue{9}","\\myresidue{10}")
write.table(bp.audio.search$stats,
			file = out.file.boxplot,
			quote = FALSE,
			sep = ",",
			eol = "\n",
			dec = ".",
			row.names = FALSE,
			col.names = TRUE)
bp.audio.selection = boxplot(dat.exp1$time.selection.audio~dat.exp1$pattern.number, plot=FALSE)
#dat.exp1$time.selection.audio = boxplot.filter(dat.exp1$time.selection.audio, bp.audio.selection$out)
write.table(bp.audio.selection$stats,
			file = out.file.boxplot,
			quote = FALSE,
			sep = ",",
			eol = "\n",
			dec = ".",
			row.names = FALSE,
			col.names = FALSE,
			append=TRUE)
shapiro = shapiro.test(dat.exp1$time.search.audio)
dat.exp1.levene = na.omit(data.frame(time.search.audio=dat.exp1$time.search.audio, pattern.number=dat.exp1$pattern.number))
levene = levene.test(dat.exp1.levene$time.search.audio, dat.exp1.levene$pattern.number)
pat1 = dat.exp1[dat.exp1$pattern.number == 1,]$time.search.audio
pat2 = dat.exp1[dat.exp1$pattern.number == 2,]$time.search.audio
pat3 = dat.exp1[dat.exp1$pattern.number == 3,]$time.search.audio
pat4 = dat.exp1[dat.exp1$pattern.number == 4,]$time.search.audio
pat5 = dat.exp1[dat.exp1$pattern.number == 5,]$time.search.audio
pat6 = dat.exp1[dat.exp1$pattern.number == 6,]$time.search.audio
pat7 = dat.exp1[dat.exp1$pattern.number == 7,]$time.search.audio
pat8 = dat.exp1[dat.exp1$pattern.number == 8,]$time.search.audio
pat9 = dat.exp1[dat.exp1$pattern.number == 9,]$time.search.audio
pat10 = dat.exp1[dat.exp1$pattern.number == 10,]$time.search.audio
pat = cbind(pat1, pat2, pat3, pat4, pat5, pat6, pat7, pat8, pat9, pat10)
friedman = friedman.test(pat)
wilcox = pairwise.wilcox.test(dat.exp1$time.search.audio, dat.exp1$pattern.number, p.adj="holm", exact=TRUE, pair=TRUE)
out.anova = friedman2tex(friedman)
out.file.anova = gsub(".csv", "-anova-search.tex", out.file.boxplot)
write(
	  out.anova,
	  file = out.file.anova
	  )
dat = dat.exp1
pop.a = dat[ dat$pattern.number == 1 | dat$pattern.number == 2 | dat$pattern.number == 3 | dat$pattern.number == 4 | dat$pattern.number == 5 | dat$pattern.number == 6 | dat$pattern.number == 7 | dat$pattern.number == 8, ]$time.search.audio
pop.b = dat[ dat$pattern.number == 9 | dat$pattern.number == 10, ]$time.search.audio
out.ratio = evolution2tex(pop.a, pop.b)
out.file.ratio = gsub(".csv", "-ratio-search.tex", out.file.boxplot)
write(
	  out.ratio,
	  file = out.file.ratio
	  )
shapiro = shapiro.test(dat.exp1$time.selection.audio)
dat.exp1.levene = na.omit(data.frame(time.selection.audio=dat.exp1$time.selection.audio, pattern.number=dat.exp1$pattern.number))
levene = levene.test(dat.exp1.levene$time.selection.audio, dat.exp1.levene$pattern.number)
pat1 = dat.exp1[dat.exp1$pattern.number == 1,]$time.selection.audio
pat2 = dat.exp1[dat.exp1$pattern.number == 2,]$time.selection.audio
pat3 = dat.exp1[dat.exp1$pattern.number == 3,]$time.selection.audio
pat4 = dat.exp1[dat.exp1$pattern.number == 4,]$time.selection.audio
pat5 = dat.exp1[dat.exp1$pattern.number == 5,]$time.selection.audio
pat6 = dat.exp1[dat.exp1$pattern.number == 6,]$time.selection.audio
pat7 = dat.exp1[dat.exp1$pattern.number == 7,]$time.selection.audio
pat8 = dat.exp1[dat.exp1$pattern.number == 8,]$time.selection.audio
pat9 = dat.exp1[dat.exp1$pattern.number == 9,]$time.selection.audio
pat10 = dat.exp1[dat.exp1$pattern.number == 10,]$time.selection.audio
pat = cbind(pat1, pat2, pat3, pat4, pat5, pat6, pat7, pat8, pat9, pat10)
friedman = friedman.test(pat)
wilcox = pairwise.wilcox.test(dat.exp1$time.selection.audio, dat.exp1$pattern.number, p.adj="holm", exact=TRUE, pair=TRUE)
out.anova = friedman2tex(friedman)
out.file.anova = gsub(".csv", "-anova-selection.tex", out.file.boxplot)
write(
	  out.anova,
	  file = out.file.anova
	  )
dat = dat.exp1
pop.a = dat[ dat$pattern.number == 1 | dat$pattern.number == 2 | dat$pattern.number == 3 | dat$pattern.number == 4 | dat$pattern.number == 5 | dat$pattern.number == 7 | dat$pattern.number == 8 | dat$pattern.number == 9 | dat$pattern.number == 10, ]$time.selection.audio
pop.b = dat[ dat$pattern.number == 6, ]$time.selection.audio
out.ratio = evolution2tex(pop.a, pop.b)
out.file.ratio = gsub(".csv", "-ratio-selection.tex", out.file.boxplot)
write(
	  out.ratio,
	  file = out.file.ratio
	  )

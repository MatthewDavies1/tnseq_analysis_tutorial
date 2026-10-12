#logFC volcano plot for tnseq analysis of Langerin binding. Compares langerin-positive and langerin-negative mutant pools with log

library(tidyr)
library(dplyr)
library(ggnewscale)
library(ggplot2)


data_long <-read.csv("data_long_edited.csv", sep = ";")

#hlines df
lines_df <- data.frame(
  y = c(0, 2, -2),
  colour = c("black", "black", "black"),
  linetype = c("solid", "dashed", "dashed"),
  size = 
)

ggplot(data_long) + 
  geom_rect(aes(ymin = 0, fill = as.factor(fill), alpha = colour, xmin = start, xmax = end, ymax = value,
                color = border2)) +
  scale_color_manual(values = c("neg_border" = "#1da1c8", "pos_border" = "#c8441d"), na.value = NA) +
  scale_fill_manual("Sorted transposon library", values = c("1" = "#1da1c8", "0" = "#c8441d"),
                    labels = c("Langerin-positive", "Langerin-negative")) +
  scale_x_continuous(limits = c(0, 1892123), breaks = seq(100000, 1900000, 100000), labels = seq(0.1, 1.9, 0.1), expand = c(0,0)) +
  scale_y_continuous(limits = c(-8, 8), breaks = seq(-8, 8, 2)) +
  scale_alpha_manual(values = c("max" = 1, "medium" = 0, "min"= 0)) +
  guides(alpha = "none", color = "none") + 
  new_scale_color() +
  geom_hline(aes(yintercept = y, color = colour, linetype = linetype), linewidth = c(1, 0.1, 0.1), data = lines_df) +
  scale_color_identity() + 
  scale_linetype_identity() +
  xlab("Nucleotide location (Mb)") + 
  ylab("logFC (compared to unstained library)") +
  theme_classic() +
  theme(legend.text = element_text(size = 14), legend.title = element_text(size = 16),
        axis.title = element_text(size = 16), axis.text = element_text(size = 12),
        axis.title.x = element_text(vjust = -1), axis.title.y = element_text(vjust = 2.5))


ggsave(filename = "genome_figure_illustrator_input", width = 10, height = 6, device = 'tiff', dpi = 700, units = "in")

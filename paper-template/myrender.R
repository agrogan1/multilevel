# render document to multiple formats

quarto::quarto_render(
  "./paper-template/cross-sectional-multilevel.qmd", 
  output_format = c("pdf", 
                    "html", 
                    "docx"))


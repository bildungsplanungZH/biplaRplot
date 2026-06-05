# biplaRplot

R-Package der Bildungsplanung (bipla) für CD-konforme Grafiken mit `ggplot2` beim Kanton Zürich.

### Kontakt
Christina Arn: christina.arn@bi.zh.ch\
Sarah Gerhard: sarah.gerhard@bi.zh.ch\
Thomas Radinger: thomas.radinger@bi.zh.ch\

### Kurzbeschreibung
Das Package enthält Funktionen zum Erstellen von möglichst CD-konformen Grafiken mit `ggplot2`. In `biplaRplot` enthalten sind:
- Funktionen zur Verwendung der zhweb-Farbpaletten für Grafiken
- Funktionen zur Formatierung der Achsen (mit Hochkomma, Prozent, Schuljahr)
- Ein minimales ggplot2-Theme

### Installation
Package installieren mit `devtools::install_github("bildungsplanungZH/biplaRplot", build_vignettes = TRUE)`

### Anwendungsbeispiel
```r
library(biplaRplot)

ggplot(mtcars, aes(x = mpg, y = disp, colour = hp)) +
    geom_point() +
    scale_colour_zhweb("zhweb_divergingRedBlue",
                       discrete = FALSE,
                       guide = guide_colourbar(barwidth = 20, barheight = 2)) + 
    labs(
        title = "Beispieltitel: Beziehung zwischen Kraftstoffeffizienz, Hubraum und Motorleistung",
        caption = "Beispielfussnote: Datenquelle = mtcars (R-Standarddatensatz)",
        x = "Kraftstoffeffizienz (mpg)",
        y = "Hubraum (disp)",
        colour = "Pferdestärke (hp)"
    ) +
    theme_biplar()
```

### Geplante Releases / Milestones
- tbd

### Vergangene Releases / Milestones
- [Version 0.1](https://github.com/bildungsplanungZH/biplaRplot/milestone/1) im Januar 2026
- [Version 0.2](https://github.com/bildungsplanungZH/biplaRplot/milestone/2) im Juni 2026

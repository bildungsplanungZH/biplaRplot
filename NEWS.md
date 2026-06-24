# biplaRplot 0.2.2

Bugfix: `element_geom()` wurde in `theme_biplaR()` entfernt, da es globale Geom-Defaults überschrieben hat. Anstattdessen werden Geom-Defaults einzeln gesetzt.

# biplaRplot 0.2.1

Korrektur von Tippfehlern

# biplaRplot 0.2.0

Folgende Erweiterungen wurden in dieser Version umgesetzt:

- Farbpaletten und Farbfunktionen:
  - Aktualisierung der bestehenden Farbpaletten aufgrund von Anpassungen der zhweb-Farben.
  - Hinzufügen der divergierenden Farbskalen
    - `zhweb_divergingRedBlue`
    - `zhweb_divergingOrangeAquamarine`
    - Hinzufügen des Argument `reverse` in `scale_colour_zhweb()` und `scale_fill_zhweb()` zum Umkehren der Reihenfolge divergierender Farbskalen.
  - Erweiterte Testabdeckung für die Farbfunktionen.

- Verbesserungen von `theme_biplar()`:
  - Hinzufügen eines `...`-Argument zur Übergabe zusätzlicher Argumente an `ggplot2::theme()`.
  - Behoben: bessere Sichtbarkeit von Gridlines in gerenderten HTML-Ausgaben.
  - Behoben: Schriftfarbe von `geom_text()` wird nun korrekt gesetzt.

- Verbesserungen der `scale_x_*()`- und `scale_y_*()`-Funktionen:
  - Hinzufügen von Standardbeschriftungen:
    - `scale_x_syear()`: "Schuljahr"
    - `scale_x_pct()` und `scale_y_pct()`: "Anteil in Prozent"
  - Hinzufügen eines `...`-Arguments zur Übergabe zusätzlicher Argumente an die entsprechenden `ggplot2`-Skalenfunktionen.

## biplaRplot 0.1.0 

Die erste Version enthält folgende Funktionalitäten:

- Funktionen zur Verwendung der zhweb-Farbpaletten
  - `assign_project_colours()`: Ordnet Kategorien innerhalb einer Domäne eindeutige Farben zu. 
  - `list_zhweb_colour_domains()`: Listet alle Domänen auf, für die eine Farbpalette im Registry hinterlegt wurde.
  - `preview_zhweb_colours()`: Erstellt ein ggplot-Objekt für die Farbvorschau
  - `scale_colour_zhweb()`: Erzeugt eine Colour-Farbskala für ggplot2-Objekte
  - `scale_fill_zhweb()`: Erzeugt eine Fill-Farbskala für ggplot2-Objekte
  
- Funktionen zur Formattierung der Achsen
  - `scale_x_syear()`: Formattiert X-Achse als Schuljahre
  - `scale_x_pct()`: Formattiert X-Achse in Prozent
  - `scale_y_count()`: Formattiert Y-Achse als Anzahl
  - `scale_y_pct()`: Formattiert Y-Achse in Prozent
  - `scale_y_format()`: Formattiert Y-Achse ohne Nachkommestellen und mit Hochkomma für Tausender
- `theme_biplar()`: Ein minimales ggplot-Theme für möglichst CD-konforme Grafiken

Folgende Paletten sind in der ersten Version enthalten: 

- `zhweb`: zhweb Grundfarben
- `zhweb_additional`: zhweb Zusatzfarben
- `zhweb_cat`: zhweb Farben für kategorielle Variablen
- `zhweb_grey`: zhweb Graustufen

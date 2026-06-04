#' Assign non-overlapping colours for a domain
#'
#' Assigns unique colours to a set of categories within a domain,
#' using a specified zhweb base palette and optionally falling back
#' to zhweb_additional for remaining colours. Ensures colours are
#' not reused across domains within the same registry.
#'
#' @param domain Character. Name of the domain
#' (e.g. "sex", "subject", "levels").
#' @param categories Character vector of category names to assign colours to.
#' @param palette_name Character. Name of the palette in zhweb_colours
#' (default: "zhweb_cat").
#' @param use_additional Logical. Whether to use zhweb_additional as fallback
#' (default: TRUE).
#' @param env Environment. Where the colour registry is stored
#' (default: zhweb_project_colours).
#'
#' @return Named character vector of assigned colours.
#' @export
#' @examples
#' assign_project_colours("sex", c("Männlich", "Weiblich"))
assign_project_colours <- function(domain,
                                   categories,
                                   palette_name = "zhweb",
                                   use_additional = TRUE,
                                   env = zhweb_project_colours) {
  # Check if palette exists
  if (!palette_name %in% names(zhweb_colours)) {
    stop("Unknown base palette: ", palette_name)
  }

  palette <- zhweb_colours[[palette_name]]
  palette_add <- if (use_additional) {
    zhweb_colours$zhweb_additional
  } else {
    character(0)
  }

  all_available <- c(palette, palette_add)

  # Get colours already used
  used_colours <- unlist(env$registry, use.names = FALSE)
  free_colours <- setdiff(all_available, used_colours)

  if (length(categories) > length(free_colours)) {
    stop("Not enough unused colours available for domain: ", domain)
  }

  # Assign free colours to categories
  assigned <- free_colours[seq_along(categories)]
  names(assigned) <- categories

  # Store and return
  env$registry[[domain]] <- assigned
  assigned
}


#' Preview assigned colours for a domain
#'
#' Displays a colour swatch for a given domain.
#' Useful to visually inspect whether assigned colours are distinct and
#' appropriate.
#'
#' @param domain Character. Domain name (e.g. "sex", "subject", "levels").
#' @param env Environment. Colour registry (default: zhweb_project_colours).
#'
#' @importFrom graphics par barplot text
#'
#' @return A plot showing the colour swatch.
#' @export
#'
#' @examples
#' assign_project_colours("subject", c("MINT", "Wirtschaft", "Kunst"))
#' preview_zhweb_colours("subject")
preview_zhweb_colours <- function(domain, env = zhweb_project_colours) {
  cols <- env$registry[[domain]]
  if (is.null(cols)) stop("No colours assigned for domain: ", domain)

  n <- length(cols)
  old_par <- par(mar = c(5, 4, 4, 2) + 0.1)
  on.exit(par(old_par), add = TRUE)

  # draw bars
  mids <- barplot(
    rep(1, n),
    col       = cols,
    names.arg = rep("", n),
    border    = NA,
    axes      = FALSE,
    ylab      = NULL,
    space     = 0.1,
    main      = paste0("Colours for domain: ", domain)
  )

  # place labels
  text(
    x      = mids,
    y      = 0.5,
    labels = names(cols),
    col    = "white",
    cex    = 0.8,
    font   = 2,
    srt    = 90,
    adj    = c(0.5, 0.5),
    xpd    = TRUE
  )
}

#' List domains with assigned colours
#'
#' Lists all domain names stored in the colour registry.
#'
#' @param env Colour registry (default: zhweb_project_colours)
#' @return Character vector of domain names
#'
#' @examples
#' assign_project_colours("subject", c("MINT", "Wirtschaft", "Kunst"))
#' list_zhweb_colour_domains()
#' @export
list_zhweb_colour_domains <- function(env = zhweb_project_colours) {
  names(env$registry)
}

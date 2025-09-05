scale_x_syear <- function(...) {

    ggplot2::scale_x_continuous(
        labels = \(x) paste0(x, "/", str_sub(x+1, start = -2, end = -1)),
        ...
    )

}



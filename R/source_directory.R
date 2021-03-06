#' Source R Files in Directory
#' 
#' \code{source_directory} sources all R files within a directory.
#' 
#' @param dir_name String name for directory within current working directory.
#' @param verbose Produce verbose output? Defaults to FALSE.
#' @param nested Recursively source files in subdirectories? Defaults to FALSE.
#' @param show_warnings Show warning messages, if any? Defaults to TRUE.
#' 
#' @examples
#' source_directory("src")
#' source_directory("src", verbose = TRUE, nested = TRUE)
#'
#' @export
source_directory <- function(dir_name, 
														 nested = FALSE, 
														 verbose = FALSE, 
														 show_warnings = TRUE) {
	
	files <- list.files(
		dir_name, 
		full.names = TRUE, 
		pattern = "*.R$", 
		recursive = isTRUE(nested)
	)

	if (!length(files) && show_warnings) {
		warning(dir_name, " directory does not contain R files.")
	}

	for (fn in files) {
		if (verbose) {
			cat("Sourcing: ", fn, "\n")
		}
		# TODO: catch if error
		try(source(fn, local = FALSE, echo = FALSE), silent = !verbose)
	}

	return(invisible(NULL))

}
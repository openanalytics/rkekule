
#' Read Molfile structure data from file
#' @param fileName absolute or relative path
#' @return \code{character()} of length 1
#' @export
readMolfile <- function(fileName, con = stdin()) {
	readChar(con = file(fileName), nchars = file.info(fileName)$size)
	# close(con)
}

#' Read CML structure data from file
#' @param fileName absolute or relative path
#' @return \code{character()} of length 1
#' @export
readCML <- function(fileName, con = stdin()) {
  readChar(con = file(fileName), nchars = file.info(fileName)$size)
}
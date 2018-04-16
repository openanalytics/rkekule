
#' Read Molfile structure data from file
#' @param file Molfile, either a character string (path) or a connection
#' @param nchars number of characters to read from the file or connection
#' @param encoding encoding of the molfile to read (default value \code{"UTF-8"})
#' @return \code{character()} of length 1
#' @export
readMolfile <- function(file, nchars = NULL, encoding = "UTF-8") {
  
  if (is.character(file)) {
    nchars <- file.info(file)$size
    file <- file(file, "r", encoding = encoding)
    on.exit(close(file))
  }
  if (!inherits(file, "connection")) 
    stop("'file' must be a character string or connection")
  
	readChar(con = file, nchars = nchars)
}

#' Read CML structure data from file
#' @param file CML file, either a character string (path) or a connection
#' @param nchars number of characters to read from the file or connection
#' @param encoding encoding of the CML file to read (default value \code{"UTF-8"})
#' @return \code{character()} of length 1
#' @export
readCML <- function(file, nchars = NULL, encoding = "UTF-8") {
  
  if (is.character(file)) {
    nchars <- file.info(file)$size
    file <- file(file, "r", encoding = encoding)
    on.exit(close(file))
  }
  if (!inherits(file, "connection")) 
    stop("'file' must be a character string or connection")
  
  readChar(con = file, nchars = nchars)
}
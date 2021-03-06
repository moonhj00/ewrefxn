#' A list to matrix transform function
#'
#' This fxn accepts a list and transform it to a matrix if possible
#' missing entries will be filled with NA in the returned dataframe
#' @param x a list of vectors
#'
#' @return a data frame
#' @author guangchun
#' @keywords list2matrix
#' @examples
#' tmp <- list(x=c(2,8,6,4,3),
#'             b=c(6,33,5,64,85,90),
#'             d=c('ks','foo','bar'))
#' list2matrix(tmp)
#' @rdname list2matrix
#' @export

list2matrix<-function(x) {
    maxelmlen<-maxlen(x)
    M<-matrix(data=NA,ncol=length(x),nrow=maxelmlen)
    as.data.frame(M)->M
    for(i in 1:length(x)) {
        Vec<-as.character(x[[i]])
        M[1:length(Vec),i]<-Vec
    }
    if( !is.null(names(x) )) {
	colnames(M)<-names(x)
    }
    return(M)
}

#' internal fxn used in list2matrix
#'
#' return the length of the vector element with max length
#' @param x a list of vectors
#' @keywords length
#' @export
maxlen<-function(x) {
    elemntLen<-vapply(x,length,FUN.VALUE=vector(mode="integer",length=1))
    return(max(elemntLen))
}

#' internal fxn 
#'
#' return the index of the element with max vector length in a list of vectors.
#' if there are many longest vectors,return a vector of their indice
#' @param x a list of vectors
#' @keywords index
#' @export

whichmaxlen<-function(x) {
    elemntLen<-vapply(x,length,FUN.VALUE=vector(mode="integer",length=1))
    rt<-which(elemntLen == max(elemntLen))
    return(rt)
}

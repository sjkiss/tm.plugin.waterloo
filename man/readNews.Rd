\name{readNews}
\alias{readNews}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
News Reader
}
\description{
Let's get this done.
}
\usage{
readNews(elem, language, id)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{elem}{
Something
}
  \item{language}{
Another thing
}
  \item{id}{
Something else
}
}
\details{
I hope this works
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
structure(function (elem, language, id) 
{
    function(elem, language, id) {
        author <- gsub("Author:", "", grep("^Author:", elem$content, 
            value = TRUE))
        title <- gsub("Title:", "", grep("^Title:", elem$content, 
            value = TRUE))
        section <- gsub("Section: ", "", grep("^Section: ", elem$content, 
            value = TRUE))
        datetimestamp <- strptime(gsub("Publication date: ", 
            "", grep("^Publication date:", elem$content, value = TRUE)), 
            format = "\%b \%d, \%Y")
        origin <- gsub("Publication title:", "", grep("^Publication title:", 
            elem$content, value = TRUE))
        id <- as.numeric(gsub("ProQuest document ID: ", "", grep("^^ProQuest document ID:", 
            elem$content, value = TRUE)))
        content <- elem$content[grep("^Full [Tt]ext:", elem$content):grep("^Title", 
            elem$content) - 1]
        doc <- PlainTextDocument(x = gsub("Full Text: |Full text: ", 
            "", content), author = author, heading = title, id = id, 
            datetimestamp = datetimestamp, origin = origin)
        meta(doc, "Length") <- sum(sapply(gregexpr("\\W+", doc), 
            length) + 1)
        meta(doc, "Section") <- section
        doc
    }
  }, class = c("FunctionGenerator", "function"))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line

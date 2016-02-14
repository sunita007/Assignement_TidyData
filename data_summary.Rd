\name{data_summary}
\alias{data_summary}
\docType{data}
\title{
%%  
}
\description{
%% This data set holds the mean of six variables for 6 differnt activities and 30 subjects.
}
\usage{data("data_summary")}
\format{
  A data frame with 180 observations on the following 8 variables.
  \describe{
    \item{\code{subjct}}{a numeric vector}
    \item{\code{activityname}}{a factor with levels \code{LAYING} \code{SITTING} \code{STANDING} \code{WALKING} \code{WALKING_DOWNSTAIRS} \code{WALKING_UPSTAIRS}}
    \item{\code{timeBodyAcc.mean...X}}{a numeric vector}
    \item{\code{timeBodyAcc.mean...Y}}{a numeric vector}
    \item{\code{timeBodyAcc.mean...Z}}{a numeric vector}
    \item{\code{timeGravityAcc.mean...X}}{a numeric vector}
    \item{\code{timeGravityAcc.mean...Y}}{a numeric vector}
    \item{\code{timeGravityAcc.mean...Z}}{a numeric vector}
  }
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
%% http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(data_summary)
## maybe str(data_summary) ; plot(data_summary) ...
}
\keyword{datasets}

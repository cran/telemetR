% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/build_residence.R
\name{build_residence}
\alias{build_residence}
\title{Build Continuous Residence Events}
\usage{
build_residence(
  data,
  var_groups,
  var_Id,
  var_datetime,
  var_site,
  opt_mbp,
  time_unit
)
}
\arguments{
\item{data}{the detection dataframe with columns for sites, tag IDs,
datetime, any grouping variables, and the expected ping rate.}

\item{var_groups}{a single string or vector of strings of the columns which
should be used to group animals. Common groupings are species and cohorts.}

\item{var_Id}{the column name, in quotes, which identifies the individual
transmitter/tag/organism identifier.}

\item{var_datetime}{the column name, in quotes, which identifies the date and
time of the detection event. This column should already have been converted
to POSIXct format.}

\item{var_site}{the column name, in quotes, which identifies unique residency
sites, these sites should be as distinct as possible, such that it is
infrequent that organisms can be detected at two sites at a given time.}

\item{opt_mbp}{a single optimum blanking period chosen from the output of
opt_mbp()}

\item{time_unit}{the unit of time used by the optimum maximum blanking
period, often on the same scale as the ping rate for the transmitter.}
}
\value{
A dataframe of detections which has been condensed into continuous
residence events based on the optimum maximum blanking period selected.
}
\description{
Takes a dataframe with telemetry detection data and a single optimum blanking
period chosen from the output of opt_mbp(), and groups detections by
individual, site, and any supplied grouping variables into residence events.
The residence events are created by collecting detections which occur within
the selected optimum maximum blanking period from the next detection. This
function can be very slow depending on the size of the dataframe.
}
\examples{
# Build a set of detection events after determining the optimal blanking
# period (e.g. 2500 seconds)
build_residence(data = filtered_detections,
                var_groups = "fish_type",
                var_Id = "Tag_Code",
                var_datetime = "DateTime_Local",
                var_site = "receiver_general_location",
                opt_mbp = 2500,
                time_unit = "secs")

}

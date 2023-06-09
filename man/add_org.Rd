% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add_organism.R
\name{add_org}
\alias{add_org}
\title{Add Organism Data to a Detection Dataframe}
\usage{
add_org(prefilter_file, org, time_before_detection, time_unit)
}
\arguments{
\item{prefilter_file}{a prefiltered detection dataframe from `prefilter()`}

\item{org}{a dataframe of organism data retrieved from `get_org_data()` or
`format_org()`}

\item{time_before_detection}{How long before detection could an organism be
released and still detected? Generally 2x the expected tag life.}

\item{time_unit}{The unit of time used for time_before_detection
(seconds, minutes, hours, days, weeks, months)}
}
\value{
A filtered dataframe converting the raw detection data into rows
of detections
}
\description{
This function takes a prefiltered detection dataframe from `prefilter()` and
joins it to organism data formatted using the `format_org()` function.
Detections are then filtered further based on the date and time of tag
release and expected battery life. Detections occurring before release of the
tag or after 2x the expected battery life are removed.
}
\examples{
# Format the organism data
formatted_fish <- format_org(data = fish,
                             var_Id = "TagCode",
                             var_release = "Release_Date",
                             var_tag_life = "TagLife",
                             var_ping_rate = "PRI",
                             local_time_zone = "America/Los_Angeles",
                             time_format = "\%Y-\%m-\%d \%H:\%M:\%S")

# Add organism data to the prefiltered detection data
add_org(prefilter_file = dat_filt1,
        org = formatted_fish,
        time_before_detection = 120,
        time_unit = "days")
}

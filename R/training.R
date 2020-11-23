-library(httr)

# Current Season
season_key <- "https://sportsdata.io/developers/api-documentation/golf#/free/current-season"

season_endpoint <- "https://api.sportsdata.io/golf/v2/json/CurrentSeason"

HTTP_reques_header <- "Ocp-Apim-Subscription-Key: {key}"

end <- oauth_endpoint("requestToken", "authorize", "accessToken",
                           base_url = season_endpoint
)
end


seasonData <- GET(season_key)
seasonData
status_code(seasonData)
headers(seasonData)
http_status(seasonData)
http_type(seasonData)

content(seasonData, "text", encoding = "UTF-8")
stringi::stri_enc_detect(content(seasonData, "raw"))
str(content(seasonData, "parsed"))
headers(seasonData)


app <- season_key
tken <- oauth1.0_token(
    end,
    app,
    permission = NULL,
    as_header = TRUE,
    private_key = NULL,
    cache = getOption("httr_oauth_cache")
)

# test httr basics
library(httr)
r <- GET("http://httpbin.org/get")
r
status_code(r)

headers(r)

str(content(r))
r <- GET("http://httpbin.org/get")
http_status(r)
warn_for_status(r)
stop_for_status(r)
content(r, "text")
content(r, "text", encoding = "ISO-8859-1")
stringi::stri_enc_detect(content(r, raw))

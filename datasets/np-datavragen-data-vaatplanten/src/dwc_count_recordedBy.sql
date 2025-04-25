SELECT recordedBy, count (*) as tel FROM INBO_WNMN_PLANTS
GROUP BY recordedBy
ORDER BY tel desc

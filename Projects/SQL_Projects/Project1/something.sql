SELECT
  sub.location,
  -- SUM(CASE WHEN EXTRACT(WEEK FROM sub.week_date) = 18 THEN sub.weekly_active_users ELSE NULL END) AS week_18,
  -- SUM(CASE WHEN EXTRACT(WEEK FROM sub.week_date) = 19 THEN sub.weekly_active_users ELSE NULL END) AS week_19,
  -- SUM(CASE WHEN EXTRACT(WEEK FROM sub.week_date) = 20 THEN sub.weekly_active_users ELSE NULL END) AS week_20,
  -- SUM(CASE WHEN EXTRACT(WEEK FROM sub.week_date) = 21 THEN sub.weekly_active_users ELSE NULL END) AS week_21,
  -- SUM(CASE WHEN EXTRACT(WEEK FROM sub.week_date) = 22 THEN sub.weekly_active_users ELSE NULL END) AS week_22,
  -- SUM(CASE WHEN EXTRACT(WEEK FROM sub.week_date) = 23 THEN sub.weekly_active_users ELSE NULL END) AS week_23,
  -- SUM(CASE WHEN EXTRACT(WEEK FROM sub.week_date) = 24 THEN sub.weekly_active_users ELSE NULL END) AS week_24,
  -- SUM(CASE WHEN EXTRACT(WEEK FROM sub.week_date) = 25 THEN sub.weekly_active_users ELSE NULL END) AS week_25,
  -- SUM(CASE WHEN EXTRACT(WEEK FROM sub.week_date) = 26 THEN sub.weekly_active_users ELSE NULL END) AS week_26,
  -- SUM(CASE WHEN EXTRACT(WEEK FROM sub.week_date) = 27 THEN sub.weekly_active_users ELSE NULL END) AS week_27,
  SUM(
    CASE
      WHEN EXTRACT(
        WEEK
        FROM
          sub.week_date
      ) = 28 THEN sub.weekly_active_users
      ELSE NULL
    END
  ) AS week_28,
  SUM(
    CASE
      WHEN EXTRACT(
        WEEK
        FROM
          sub.week_date
      ) = 29 THEN sub.weekly_active_users
      ELSE NULL
    END
  ) AS week_29,
  SUM(
    CASE
      WHEN EXTRACT(
        WEEK
        FROM
          sub.week_date
      ) = 30 THEN sub.weekly_active_users
      ELSE NULL
    END
  ) AS week_30,
  SUM(
    CASE
      WHEN EXTRACT(
        WEEK
        FROM
          sub.week_date
      ) = 31 THEN sub.weekly_active_users
      ELSE NULL
    END
  ) AS week_31,
  SUM(
    CASE
      WHEN EXTRACT(
        WEEK
        FROM
          sub.week_date
      ) = 32 THEN sub.weekly_active_users
      ELSE NULL
    END
  ) AS week_32,
  SUM(
    CASE
      WHEN EXTRACT(
        WEEK
        FROM
          sub.week_date
      ) = 33 THEN sub.weekly_active_users
      ELSE NULL
    END
  ) AS week_33,
  SUM(
    CASE
      WHEN EXTRACT(
        WEEK
        FROM
          sub.week_date
      ) = 34 THEN sub.weekly_active_users
      ELSE NULL
    END
  ) AS week_34,
  SUM(
    CASE
      WHEN EXTRACT(
        WEEK
        FROM
          sub.week_date
      ) = 35 THEN sub.weekly_active_users
      ELSE NULL
    END
  ) AS week_35,
  SUM(sub.weekly_active_users)
FROM
  (
    SELECT
      DATE_TRUNC ('week', e.occurred_at) AS week_date,
      location,
      COUNT(DISTINCT e.user_id) AS weekly_active_users
    FROM
      tutorial.yammer_events e
    WHERE
      e.event_type = 'engagement'
      AND e.event_name = 'login'
    GROUP BY
      1,
      2
    ORDER BY
      1,
      2
  ) sub
GROUP BY
  1
SELECT
  sub.device,
  -- SUM(CASE WHEN EXTRACT(WEEK FROM sub.week_date) = 18 THEN sub.weekly_active_users ELSE NULL END) AS week_18,
  -- SUM(CASE WHEN EXTRACT(WEEK FROM sub.week_date) = 19 THEN sub.weekly_active_users ELSE NULL END) AS week_19,
  -- SUM(CASE WHEN EXTRACT(WEEK FROM sub.week_date) = 20 THEN sub.weekly_active_users ELSE NULL END) AS week_20,
  -- SUM(CASE WHEN EXTRACT(WEEK FROM sub.week_date) = 21 THEN sub.weekly_active_users ELSE NULL END) AS week_21,
  -- SUM(CASE WHEN EXTRACT(WEEK FROM sub.week_date) = 22 THEN sub.weekly_active_users ELSE NULL END) AS week_22,
  -- SUM(CASE WHEN EXTRACT(WEEK FROM sub.week_date) = 23 THEN sub.weekly_active_users ELSE NULL END) AS week_23,
  -- SUM(CASE WHEN EXTRACT(WEEK FROM sub.week_date) = 24 THEN sub.weekly_active_users ELSE NULL END) AS week_24,
  -- SUM(CASE WHEN EXTRACT(WEEK FROM sub.week_date) = 25 THEN sub.weekly_active_users ELSE NULL END) AS week_25,
  -- SUM(CASE WHEN EXTRACT(WEEK FROM sub.week_date) = 26 THEN sub.weekly_active_users ELSE NULL END) AS week_26,
  -- SUM(CASE WHEN EXTRACT(WEEK FROM sub.week_date) = 27 THEN sub.weekly_active_users ELSE NULL END) AS week_27,
  SUM(
    CASE
      WHEN EXTRACT(
        WEEK
        FROM
          sub.week_date
      ) = 28 THEN sub.weekly_active_users
      ELSE NULL
    END
  ) AS week_28,
  SUM(
    CASE
      WHEN EXTRACT(
        WEEK
        FROM
          sub.week_date
      ) = 29 THEN sub.weekly_active_users
      ELSE NULL
    END
  ) AS week_29,
  SUM(
    CASE
      WHEN EXTRACT(
        WEEK
        FROM
          sub.week_date
      ) = 30 THEN sub.weekly_active_users
      ELSE NULL
    END
  ) AS week_30,
  SUM(
    CASE
      WHEN EXTRACT(
        WEEK
        FROM
          sub.week_date
      ) = 31 THEN sub.weekly_active_users
      ELSE NULL
    END
  ) AS week_31,
  SUM(
    CASE
      WHEN EXTRACT(
        WEEK
        FROM
          sub.week_date
      ) = 32 THEN sub.weekly_active_users
      ELSE NULL
    END
  ) AS week_32,
  SUM(
    CASE
      WHEN EXTRACT(
        WEEK
        FROM
          sub.week_date
      ) = 33 THEN sub.weekly_active_users
      ELSE NULL
    END
  ) AS week_33,
  SUM(
    CASE
      WHEN EXTRACT(
        WEEK
        FROM
          sub.week_date
      ) = 34 THEN sub.weekly_active_users
      ELSE NULL
    END
  ) AS week_34,
  SUM(
    CASE
      WHEN EXTRACT(
        WEEK
        FROM
          sub.week_date
      ) = 35 THEN sub.weekly_active_users
      ELSE NULL
    END
  ) AS week_35,
  SUM(sub.weekly_active_users)
FROM
  (
    SELECT
      DATE_TRUNC ('week', e.occurred_at) AS week_date,
      device,
      COUNT(DISTINCT e.user_id) AS weekly_active_users
    FROM
      tutorial.yammer_events e
    WHERE
      e.event_type = 'engagement'
      AND e.event_name = 'login'
    GROUP BY
      1,
      2
    ORDER BY
      1,
      2
  ) sub
GROUP BY
  1
SELECT
  sub.event_name,
  -- SUM(CASE WHEN EXTRACT(WEEK FROM sub.week_date) = 18 THEN sub.weekly_active_users ELSE NULL END) AS week_18,
  -- SUM(CASE WHEN EXTRACT(WEEK FROM sub.week_date) = 19 THEN sub.weekly_active_users ELSE NULL END) AS week_19,
  -- SUM(CASE WHEN EXTRACT(WEEK FROM sub.week_date) = 20 THEN sub.weekly_active_users ELSE NULL END) AS week_20,
  -- SUM(CASE WHEN EXTRACT(WEEK FROM sub.week_date) = 21 THEN sub.weekly_active_users ELSE NULL END) AS week_21,
  -- SUM(CASE WHEN EXTRACT(WEEK FROM sub.week_date) = 22 THEN sub.weekly_active_users ELSE NULL END) AS week_22,
  -- SUM(CASE WHEN EXTRACT(WEEK FROM sub.week_date) = 23 THEN sub.weekly_active_users ELSE NULL END) AS week_23,
  -- SUM(CASE WHEN EXTRACT(WEEK FROM sub.week_date) = 24 THEN sub.weekly_active_users ELSE NULL END) AS week_24,
  -- SUM(CASE WHEN EXTRACT(WEEK FROM sub.week_date) = 25 THEN sub.weekly_active_users ELSE NULL END) AS week_25,
  -- SUM(CASE WHEN EXTRACT(WEEK FROM sub.week_date) = 26 THEN sub.weekly_active_users ELSE NULL END) AS week_26,
  -- SUM(CASE WHEN EXTRACT(WEEK FROM sub.week_date) = 27 THEN sub.weekly_active_users ELSE NULL END) AS week_27,
  SUM(
    CASE
      WHEN EXTRACT(
        WEEK
        FROM
          sub.week_date
      ) = 28 THEN sub.weekly_active_users
      ELSE NULL
    END
  ) AS week_28,
  SUM(
    CASE
      WHEN EXTRACT(
        WEEK
        FROM
          sub.week_date
      ) = 29 THEN sub.weekly_active_users
      ELSE NULL
    END
  ) AS week_29,
  SUM(
    CASE
      WHEN EXTRACT(
        WEEK
        FROM
          sub.week_date
      ) = 30 THEN sub.weekly_active_users
      ELSE NULL
    END
  ) AS week_30,
  SUM(
    CASE
      WHEN EXTRACT(
        WEEK
        FROM
          sub.week_date
      ) = 31 THEN sub.weekly_active_users
      ELSE NULL
    END
  ) AS week_31,
  SUM(
    CASE
      WHEN EXTRACT(
        WEEK
        FROM
          sub.week_date
      ) = 32 THEN sub.weekly_active_users
      ELSE NULL
    END
  ) AS week_32,
  SUM(
    CASE
      WHEN EXTRACT(
        WEEK
        FROM
          sub.week_date
      ) = 33 THEN sub.weekly_active_users
      ELSE NULL
    END
  ) AS week_33,
  SUM(
    CASE
      WHEN EXTRACT(
        WEEK
        FROM
          sub.week_date
      ) = 34 THEN sub.weekly_active_users
      ELSE NULL
    END
  ) AS week_34,
  SUM(
    CASE
      WHEN EXTRACT(
        WEEK
        FROM
          sub.week_date
      ) = 35 THEN sub.weekly_active_users
      ELSE NULL
    END
  ) AS week_35,
  SUM(sub.weekly_active_users) AS total_users
FROM
  (
    SELECT
      DATE_TRUNC ('week', e.occurred_at) AS week_date,
      event_name,
      COUNT(DISTINCT e.user_id) AS weekly_active_users
    FROM
      tutorial.yammer_events e
    WHERE
      e.event_type = 'engagement'
      -- AND e.event_name = 'login'
    GROUP BY
      1,
      2
    ORDER BY
      1,
      2
  ) sub
GROUP BY
  1
ORDER BY
  total_users DESC
  -- SELECT DATE_TRUNC('week', e.occurred_at),
  --       COUNT(DISTINCT e.user_id) AS weekly_active_users
  --   FROM tutorial.yammer_events e
  -- WHERE e.event_type = 'engagement'
  --   AND e.event_name = 'login'
  -- GROUP BY 1
  -- ORDER BY 1
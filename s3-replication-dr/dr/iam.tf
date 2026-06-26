resource "aws_iam_role" "replication" {

  name = "s3-cross-region-replication-role"

  assume_role_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Principal = {

          Service = "s3.amazonaws.com"

        }

        Action = "sts:AssumeRole"

      }

    ]

  })
}

################### REPLICATION POLICY#########################################

resource "aws_iam_policy" "replication_policy" {

  name = "s3-replication-policy"

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Action = [

          "s3:GetReplicationConfiguration",
          "s3:ListBucket"

        ]

        Resource = aws_s3_bucket.current.arn

      },

      {

        Effect = "Allow"

        Action = [

          "s3:GetObjectVersion",
          "s3:GetObjectVersionAcl",
          "s3:GetObjectVersionTagging"

        ]

        Resource = "${aws_s3_bucket.current.arn}/*"

      },

      {

        Effect = "Allow"

        Action = [

          "s3:ReplicateObject",
          "s3:ReplicateDelete",
          "s3:ReplicateTags"

        ]

        Resource = "${aws_s3_bucket.dr.arn}/*"

      }

    ]

  })
}

resource "aws_iam_role_policy_attachment" "attach" {

  role = aws_iam_role.replication.name

  policy_arn = aws_iam_policy.replication_policy.arn

}
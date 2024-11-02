{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "2fdfbaa4",
   "metadata": {
    "papermill": {
     "duration": 0.003907,
     "end_time": "2024-11-02T01:23:07.426898",
     "exception": false,
     "start_time": "2024-11-02T01:23:07.422991",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "A fish breeder wants to compare a new oxygenation system with the one he uses now. He wants to know whether the oxygen saturation differs between the old and the new oxygenation system. For this, he uses the old system in some aquaria and the new system in some other aquaria.\n",
    "\n",
    "You find the data in aqua25.csv. Each line contains data for one aquarium with the used system in the first column and the oxygen saturation in the second column."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "888795c4",
   "metadata": {
    "papermill": {
     "duration": 0.003275,
     "end_time": "2024-11-02T01:23:07.433858",
     "exception": false,
     "start_time": "2024-11-02T01:23:07.430583",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The dataset contains two columns:\n",
    "\n",
    "• system: Indicates whether the oxygenation system used is the “old” or “new” system.\n",
    "• saturation: Records the oxygen saturation level in each aquarium.\n",
    "\n",
    "To compare the oxygen saturation levels between the old and new systems, we can perform a statistical test, such as a t-test."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "78d932e5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-11-02T01:23:07.446435Z",
     "iopub.status.busy": "2024-11-02T01:23:07.443528Z",
     "iopub.status.idle": "2024-11-02T01:23:07.762580Z",
     "shell.execute_reply": "2024-11-02T01:23:07.760637Z"
    },
    "papermill": {
     "duration": 0.328598,
     "end_time": "2024-11-02T01:23:07.765651",
     "exception": false,
     "start_time": "2024-11-02T01:23:07.437053",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "Attaching package: ‘dplyr’\n",
      "\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "The following objects are masked from ‘package:stats’:\n",
      "\n",
      "    filter, lag\n",
      "\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    intersect, setdiff, setequal, union\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "# Load necessary libraries\n",
    "library(dplyr)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "493fea5d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-11-02T01:23:07.811273Z",
     "iopub.status.busy": "2024-11-02T01:23:07.774700Z",
     "iopub.status.idle": "2024-11-02T01:23:07.853497Z",
     "shell.execute_reply": "2024-11-02T01:23:07.850926Z"
    },
    "papermill": {
     "duration": 0.087522,
     "end_time": "2024-11-02T01:23:07.856791",
     "exception": false,
     "start_time": "2024-11-02T01:23:07.769269",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>system</th><th scope=col>saturation</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>old</td><td>72.0</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>old</td><td>77.4</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>old</td><td>78.7</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>old</td><td>76.4</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>old</td><td>78.7</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>old</td><td>76.8</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 2\n",
       "\\begin{tabular}{r|ll}\n",
       "  & system & saturation\\\\\n",
       "  & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & old & 72.0\\\\\n",
       "\t2 & old & 77.4\\\\\n",
       "\t3 & old & 78.7\\\\\n",
       "\t4 & old & 76.4\\\\\n",
       "\t5 & old & 78.7\\\\\n",
       "\t6 & old & 76.8\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 2\n",
       "\n",
       "| <!--/--> | system &lt;chr&gt; | saturation &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| 1 | old | 72.0 |\n",
       "| 2 | old | 77.4 |\n",
       "| 3 | old | 78.7 |\n",
       "| 4 | old | 76.4 |\n",
       "| 5 | old | 78.7 |\n",
       "| 6 | old | 76.8 |\n",
       "\n"
      ],
      "text/plain": [
       "  system saturation\n",
       "1 old    72.0      \n",
       "2 old    77.4      \n",
       "3 old    78.7      \n",
       "4 old    76.4      \n",
       "5 old    78.7      \n",
       "6 old    76.8      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Read the CSV file\n",
    "data <- read.csv(\"/kaggle/input/aqua25/aqua25.csv\")\n",
    "# Display the first few rows of the dataset\n",
    "head(data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "c3ede761",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-11-02T01:23:07.868870Z",
     "iopub.status.busy": "2024-11-02T01:23:07.867221Z",
     "iopub.status.idle": "2024-11-02T01:23:07.888702Z",
     "shell.execute_reply": "2024-11-02T01:23:07.886611Z"
    },
    "papermill": {
     "duration": 0.030744,
     "end_time": "2024-11-02T01:23:07.891541",
     "exception": false,
     "start_time": "2024-11-02T01:23:07.860797",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t45 obs. of  2 variables:\n",
      " $ system    : chr  \"old\" \"old\" \"old\" \"old\" ...\n",
      " $ saturation: num  72 77.4 78.7 76.4 78.7 76.8 78.7 75 78.5 78.7 ...\n"
     ]
    }
   ],
   "source": [
    "# Check structure of data\n",
    "str(data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "f763df09",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-11-02T01:23:07.903665Z",
     "iopub.status.busy": "2024-11-02T01:23:07.901903Z",
     "iopub.status.idle": "2024-11-02T01:23:07.935611Z",
     "shell.execute_reply": "2024-11-02T01:23:07.933705Z"
    },
    "papermill": {
     "duration": 0.042766,
     "end_time": "2024-11-02T01:23:07.938262",
     "exception": false,
     "start_time": "2024-11-02T01:23:07.895496",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Shapiro-Wilk Test for Old System: W = 0.7702776 , p-value = 0.000238432 \n"
     ]
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Shapiro-Wilk Test for New System: W = 0.7427625 , p-value = 3.911929e-05 \n"
     ]
    }
   ],
   "source": [
    "# Check Normality for each group\n",
    "shapiro_old <- shapiro.test(data$saturation[data$system == \"old\"])\n",
    "shapiro_new <- shapiro.test(data$saturation[data$system == \"new\"])\n",
    "# Print Shapiro-Wilk test results\n",
    "cat(\"Shapiro-Wilk Test for Old System: W =\", shapiro_old$statistic, \", p-value =\", shapiro_old$p.value, \"\\n\")\n",
    "cat(\"Shapiro-Wilk Test for New System: W =\", shapiro_new$statistic, \", p-value =\", shapiro_new$p.value, \"\\n\")\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "74c8424c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-11-02T01:23:07.950234Z",
     "iopub.status.busy": "2024-11-02T01:23:07.948520Z",
     "iopub.status.idle": "2024-11-02T01:23:07.973663Z",
     "shell.execute_reply": "2024-11-02T01:23:07.971349Z"
    },
    "papermill": {
     "duration": 0.034111,
     "end_time": "2024-11-02T01:23:07.976407",
     "exception": false,
     "start_time": "2024-11-02T01:23:07.942296",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "F-test for equality of variances: F = 0.8850309 , p-value = 0.7721047 \n"
     ]
    }
   ],
   "source": [
    "# Check Variance Homogeneity\n",
    "var_test <- var.test(saturation ~ system, data = data)\n",
    "cat(\"F-test for equality of variances: F =\", var_test$statistic, \", p-value =\", var_test$p.value, \"\\n\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "f2f85ccd",
   "metadata": {
    "papermill": {
     "duration": 0.004,
     "end_time": "2024-11-02T01:23:07.984541",
     "exception": false,
     "start_time": "2024-11-02T01:23:07.980541",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "p-value: This tells us the probability that the data follows a normal distribution. Typically, if the p-value is greater than 0.05, we say the data is likely to be normally distributed. If the p-value is less than 0.05, we say the data is not normally distributed.\n",
    "\n",
    "**Impact**\n",
    "\n",
    "* If data is not normal but variances are equal: Parametric tests such as the t-test can still be used, but are not recommended. A non-parametric test, such as the Mann-Whitney U test, would be more appropriate as it does not depend on the assumption of normal distribution.\n",
    "* If data are normal and variances are equal: The ideal condition is to use the standard t-test with the assumption var.equal = TRUE.\n",
    "* If the data is normal but the variances are not equal: We can still use the t-test, but must set var.equal = FALSE or use an alternative test such as Welch's t-test.\n",
    "\n",
    "Since our data is not normal but the variances are equal, the best recommendation is to use the Mann-Whitney U test instead of the t-test to avoid violating assumptions that could interfere with the interpretation of the results."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "cf00776f",
   "metadata": {
    "papermill": {
     "duration": 0.00423,
     "end_time": "2024-11-02T01:23:07.992843",
     "exception": false,
     "start_time": "2024-11-02T01:23:07.988613",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Shapiro-Wilk Test:\n",
    "The p-values for both the old system ( p = 0.000238432 ) and the new system ( p = 3.911929 or 3.9e-05 ) are well below 0.05. This indicates that the oxygen saturation values in both groups do not follow a normal distribution.\n",
    "### F-Test for Equality of Variances:\n",
    "The p-value for the F-test is 0.7721047, which is greater than 0.05. This suggests that we can assume equal variances between the two systems.\n",
    "\n",
    "Since the normality assumption is violated, using a parametric t-test may not be appropriate. Instead, we could use a non-parametric alternative, such as the **Wilcoxon rank-sum test (Mann-Whitney U test)**, which does not assume normality."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "eb9478fe",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-11-02T01:23:08.005887Z",
     "iopub.status.busy": "2024-11-02T01:23:08.003983Z",
     "iopub.status.idle": "2024-11-02T01:23:08.028202Z",
     "shell.execute_reply": "2024-11-02T01:23:08.026014Z"
    },
    "papermill": {
     "duration": 0.033748,
     "end_time": "2024-11-02T01:23:08.031192",
     "exception": false,
     "start_time": "2024-11-02T01:23:07.997444",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\n",
      "\tWilcoxon rank sum test with continuity correction\n",
      "\n",
      "data:  saturation by system\n",
      "W = 401, p-value = 0.0007055\n",
      "alternative hypothesis: true location shift is not equal to 0\n",
      "\n"
     ]
    }
   ],
   "source": [
    "# Perform Mann-Whitney U Test (Wilcoxon rank-sum test)\n",
    "wilcox_test <- wilcox.test(saturation ~ system, data = data, exact = FALSE)\n",
    "print(wilcox_test)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7050cd82",
   "metadata": {
    "papermill": {
     "duration": 0.004199,
     "end_time": "2024-11-02T01:23:08.039554",
     "exception": false,
     "start_time": "2024-11-02T01:23:08.035355",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "* Since the p-value < 0.05, we reject the null hypothesis and conclude that there is a significant difference in oxygen saturation between the old and new systems.\n",
    "* This is a non-parametric test, used here because the data did not meet the normality assumption."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "39a3413a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-11-02T01:23:08.052788Z",
     "iopub.status.busy": "2024-11-02T01:23:08.051030Z",
     "iopub.status.idle": "2024-11-02T01:23:08.077678Z",
     "shell.execute_reply": "2024-11-02T01:23:08.075474Z"
    },
    "papermill": {
     "duration": 0.036538,
     "end_time": "2024-11-02T01:23:08.080471",
     "exception": false,
     "start_time": "2024-11-02T01:23:08.043933",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\n",
      "\tTwo Sample t-test\n",
      "\n",
      "data:  saturation by system\n",
      "t = 2.7133, df = 43, p-value = 0.009544\n",
      "alternative hypothesis: true difference in means between group new and group old is not equal to 0\n",
      "95 percent confidence interval:\n",
      " 0.3426302 2.3264175\n",
      "sample estimates:\n",
      "mean in group new mean in group old \n",
      "         78.72500          77.39048 \n",
      "\n"
     ]
    }
   ],
   "source": [
    "# Perform T-Test\n",
    "t_test <- t.test(saturation ~ system, data = data, var.equal = (var_test$p.value > 0.05))\n",
    "print(t_test)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e0118c10",
   "metadata": {
    "papermill": {
     "duration": 0.004482,
     "end_time": "2024-11-02T01:23:08.089486",
     "exception": false,
     "start_time": "2024-11-02T01:23:08.085004",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "* With a p-value < 0.05, the t-test also indicates a significant difference in oxygen saturation between the old and new systems.\n",
    "* The 95% confidence interval for the difference in means is [0.3426302, 2.3264175], and the mean oxygen saturation for the new system (78.725) is higher than for the old system (77.39048).\n",
    "* However, because the normality assumption was violated, the t-test results should be interpreted with caution."
   ]
  }
 ],
 "metadata": {
  "kaggle": {
   "accelerator": "none",
   "dataSources": [
    {
     "datasetId": 5992289,
     "sourceId": 9781120,
     "sourceType": "datasetVersion"
    }
   ],
   "dockerImageVersionId": 30749,
   "isGpuEnabled": false,
   "isInternetEnabled": true,
   "language": "r",
   "sourceType": "notebook"
  },
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.4.0"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 4.190678,
   "end_time": "2024-11-02T01:23:08.217734",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2024-11-02T01:23:04.027056",
   "version": "2.6.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}

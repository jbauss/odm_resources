-- Average color is the color created by summing the values for the red, green, and blue channels in each pixel, then dividing each sum by the number of pixels in the image.
-- Brightness is defined as an image’s lightness or darkness, on a scale of 0 to 1. A white image would measure a 1, while a black image would measure a 0.
-- Contrast is defined as the extent to which an image has differences in brightness throughout, on a scale of 0 to 1. Higher contrast (higher differences in brightness) enable objects to stand out. Lower contrast (lower differences in brightness) means objects don’t stand out as much.
-- Entropy is a measure of an image’s randomness, often used to characterize the complexity of artwork. A 10, for our sake, is pretty high—whereas a 0 is very low.



-- 1. Write a SQL query that a translator might take interest in: list, side by side, the Japanese title and the English title for each print. Ensure the Japanese title is the first column, followed by the English title.

SELECT japanese_title, english_title FROM views;

-- 2. Write a SQL query to list the English title and average colors of prints by Hokusai that include “river” in the English title.

SELECT english_title, average_color FROM views WHERE english_title LIKE '%river%';

-- 3. Write a SQL query to count how many prints by Hokusai include “Fuji” in the English title. Though all of Hokusai’s prints focused on Mt. Fuji, in how many did “Fuji” make it into the title?

SELECT COUNT(*) FROM views WHERE english_title LIKE '%fuji%';

-- Answer: 6

-- 4. Write a SQL query to count how many prints by Hiroshige have English titles that refer to the “Eastern Capital”. Hiroshige’s prints were created in Japan’s “Edo period,” referencing the eastern capital city of Edo, now Tokyo.

SELECT COUNT(*) FROM views WHERE english_title LIKE '%eastern capital%'

-- 5. Write a SQL query to find the highest contrast value of prints by Hokusai. Name the column “Maximum Contrast”. Does Hokusai’s prints most contrasting print actually have much contrast?

SELECT MAX(contrast) AS "Maximum Contrast" FROM views;

-- 6. Write a SQL query to find the average entropy of prints by Hiroshige, rounded to two decimal places. Call the resulting column “Hiroshige Average Entropy”.

SELECT ROUND(AVG(entropy), 2) AS "Hiroshige Average Entropy" FROM views;

-- 7. Write a SQL query to list the English titles and brightness of the 5 brightest prints by Hiroshige, from most to least bright. Compare them to this list on Wikipedia to see if your results match the print’s aesthetics.
    -- https://en.wikipedia.org/wiki/Thirty-six_Views_of_Mount_Fuji_(Hiroshige)

SELECT english_title, brightness FROM views ORDER BY brightness DESC LIMIT 5;

-- 8. Write a SQL query to list the English titles and contrast of the 5 prints with the least contrast by Hokusai, from least to highest contrast. Compare them to this list on Wikipedia to see if your results match the print’s aesthetics.

SELECT english_title, contrast FROM views ORDER BY contrast LIMIT 5;

-- 9. Write a SQL query to find the English title and artist of the print with the highest brightness.

SELECT english_title, artist, brightness FROM views ORDER BY brightness DESC LIMIT 1;

-- 10. Write a SQL query to answer a question of your choice about the prints. The query should:
    -- Make use of AS to rename a column
    -- Involve at least one condition, using WHERE
    -- Sort by at least one column, using ORDER BY
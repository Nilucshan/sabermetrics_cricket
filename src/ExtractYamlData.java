/**
 * Created by Nilucshan on 5/15/2018.
 */

import java.io.File;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.logging.Logger;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;
import org.supercsv.io.CsvMapWriter;
import org.supercsv.prefs.CsvPreference;

public class ExtractYamlData {
    private final static Logger LOGGER = Logger.getLogger(ExtractYamlData.class.getName());

    public static void main(String[] args) {

        ObjectMapper mapper = new ObjectMapper(new YAMLFactory());
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

        try {

            PrintWriter out = new PrintWriter("country_data.csv");
            File directory = new File("sri_lanka");
            File[] files = directory.listFiles();
            StringWriter sw = new StringWriter();
            CsvMapWriter writer = new CsvMapWriter(sw, CsvPreference.STANDARD_PREFERENCE);

            String[] headers = {"city", "dates", "match_type", "outcome", "overs", "player_of_match", "venue", "winner", "opposition", "toss_winner", "toss_decision", "total_runs", "opposition_runs"};
            writer.writeHeader(headers);

            for (File file : files) {

                Country country = mapper.readValue(file, Country.class);
                country.getInfo().put("dates", country.getInfo().get("dates").toString().replace("[", ""));
                country.getInfo().put("dates", country.getInfo().get("dates").toString().replace("]", ""));

                String winner = country.getInfo().get("outcome").toString().substring(country.getInfo().get("outcome").toString().lastIndexOf("=") + 1).replace("}", "");
                country.getInfo().put("winner", winner);

                country.getInfo().put("teams", country.getInfo().get("teams").toString().replace("[", ""));
                country.getInfo().put("teams", country.getInfo().get("teams").toString().replace("]", ""));
                String oppositionSplit[] = country.getInfo().get("teams").toString().split(",");
                if (oppositionSplit[0].contains("Sri")) {
                    country.getInfo().put("opposition", oppositionSplit[1]);
                } else {
                    country.getInfo().put("opposition", oppositionSplit[0]);
                }

                country.getInfo().put("toss", country.getInfo().get("toss").toString().replace("{", ""));
                country.getInfo().put("toss", country.getInfo().get("toss").toString().replace("}", ""));
                String[] tossSplit = country.getInfo().get("toss").toString().split(",");
                if (tossSplit[0].contains("winner")) {
                    country.getInfo().put("toss_winner", tossSplit[0].replace("winner=", ""));
                    country.getInfo().put("toss_decision", tossSplit[1].replace("decision=", ""));
                } else {
                    country.getInfo().put("toss_winner", tossSplit[1].replace("winner=", ""));
                    country.getInfo().put("toss_decision", tossSplit[0].replace("decision=", ""));
                }

                //extracting the total runs
                String[] deliveries1stInnings = country.getInnings().get("1st innings").get("deliveries").toString().split(",");
                int deliveriesLength1stInnings = 0;
                int totalRuns1stInnings = 0;

                while (deliveriesLength1stInnings < deliveries1stInnings.length) {
                    if (deliveries1stInnings[deliveriesLength1stInnings].contains("total=")) {
                        String tempString = deliveries1stInnings[deliveriesLength1stInnings].substring(deliveries1stInnings[deliveriesLength1stInnings].lastIndexOf("=") + 1).replace("]", "");
                        tempString = tempString.replace("}", "");
                        totalRuns1stInnings = totalRuns1stInnings + Integer.parseInt(tempString);
                    }
                    deliveriesLength1stInnings++;
                }

                String[] deliveries2ndInnings = country.getInnings().get("2nd innings").get("deliveries").toString().split(",");
                int deliveriesLength2ndInnings = 0;
                int totalRuns2ndInnings = 0;

                while (deliveriesLength2ndInnings < deliveries2ndInnings.length) {
                    if (deliveries2ndInnings[deliveriesLength2ndInnings].contains("total=")) {
                        String tempString = deliveries2ndInnings[deliveriesLength2ndInnings].substring(deliveries2ndInnings[deliveriesLength2ndInnings].lastIndexOf("=") + 1).replace("]", "");
                        tempString = tempString.replace("}", "");
                        totalRuns2ndInnings = totalRuns2ndInnings + Integer.parseInt(tempString);
                    }
                    deliveriesLength2ndInnings++;
                }

                if (country.getInfo().get("winner").toString().equalsIgnoreCase("sri lanka")) {
                    country.getInfo().put("total_runs", totalRuns1stInnings > totalRuns2ndInnings ? totalRuns1stInnings : totalRuns2ndInnings);
                    country.getInfo().put("opposition_runs", totalRuns1stInnings < totalRuns2ndInnings ? totalRuns1stInnings : totalRuns2ndInnings);
                } else {
                    country.getInfo().put("opposition_runs", totalRuns1stInnings > totalRuns2ndInnings ? totalRuns1stInnings : totalRuns2ndInnings);
                    country.getInfo().put("total_runs", totalRuns1stInnings < totalRuns2ndInnings ? totalRuns1stInnings : totalRuns2ndInnings);
                }

                writer.write(country.getInfo(), headers);
                out.print(sw.toString());
                LOGGER.info("Extracted data from: " + file.getName());
            }

            writer.close();
            out.close();

        } catch (Exception e) {
            //TODO
            e.printStackTrace();
        }

    }

}

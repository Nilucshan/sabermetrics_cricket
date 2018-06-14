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

            String[] headers = {"city", "dates", "match_type", "outcome", "overs", "player_of_match", "venue", "winner", "opposition","toss_winner","toss_decision"};
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

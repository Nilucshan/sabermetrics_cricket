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

            String[] headers = {"city", "dates", "gender", "match_type", "outcome", "overs", "player_of_match", "teams", "toss", "umpires", "venue"};
            writer.writeHeader(headers);

            for(File file:files) {
                Country country = mapper.readValue(file, Country.class);
                writer.write(country.getInfo(), headers);
                out.print(sw.toString());
                LOGGER.info("Extracted data from: "+file.getName());
            }

            writer.close();
            out.close();

        } catch (Exception e) {
            //TODO
            e.printStackTrace();
        }

    }

}

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Scanner;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
public class CreatePDF
{
    public static void main(String[] args) 
    {
        //Create object for the scanner 
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter the content to be inserted into the PDF File");
        String content;
        content = sc.nextLine();
        try
        {
            System.out.println("Report in progress");
            //Create object for the file
            File file = new File("C:\Users\Raman\Reports\Report.pdf");
            //Create object for the File output stream
            FileOutputStream fos = new FileOutputStream(file);
            //Create object for the Document
            Document document = new Document();
            //Create Instance for pdf writer
            PdfWriter.getInstance(document, fos);
            //Open a document
            document.open();
            //Add content content to the document
            document.add(new Paragraph(content));
            //Close the the document
            document.close();
            fos.close();
            System.out.println("Success...!!!");
        }
        catch (FileNotFoundException e)
        {
            System.out.println(e.getMessage());
        }
        catch (DocumentException e) 
        {
            System.out.println(e.getMessage());
        }
        catch (IOException e) 
        {
            System.out.println(e.getMessage());
        }
    }
}
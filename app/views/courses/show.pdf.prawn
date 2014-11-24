pdf.text "Kursdetails: #{@course.titel}", :size => 30, :style => :bold
pdf.stroke_horizontal_rule

pdf.move_down(60)

tabledata = [
				["<b>Kurstyp</b>", @course.kurstyp],
				["<b>Zielpublikum</b>", @course.zielpublikum],
				["<b>Zulassung</b>", @course.zulassung],
				["<b>Abschluss</b>", @course.abschluss],
				["<b>Kursstart</b>", @course.start.strftime("%v")],
				["<b>Veranstaltungsort</b>", @course.ort],
				["<b>Leitung</b>", @course.leitung],
				["<b>Anbieter</b>", @course.anbieter],
				["<b>Preis</b>", number_to_currency(@course.preis, locale: :ch)],
				["<b>Weiterführende Informationen</b>", @course.info],
				["<b>Kontakt</b>", @course.kontakt]
]

pdf.table(tabledata, :cell_style => {:inline_format => true }, :position => :center)

pdf.move_down(60)

pdf.text "Detailbeschreibung", :style => :bold
pdf.text "#{@course.inhalt}"
 

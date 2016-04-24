/* XmlWriter.vala
 *
 * Copyright (C) 2009 - 2016 Jerry Casiano
 *
 * This file is part of Font Manager.
 *
 * Font Manager is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Font Manager is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Font Manager.  If not, see <http://www.gnu.org/licenses/>.
 *
 * Author:
 *        Jerry Casiano <JerryCasiano@gmail.com>
*/

namespace FontConfig {

    /**
     * Convenience wrapper for Xml.TextWriter
     * Sets default options, document type string and comment.
     */
    public class XmlWriter : Xml.TextWriter {

        public XmlWriter (string filepath) {
            base.filename(filepath);
            set_indent(true);
            set_indent_string("  ");
            start_document();
            write_string("<!DOCTYPE fontconfig SYSTEM \"fonts.dtd\">\n");
            write_comment(_(" Generated by Font Manager. Do NOT edit this file. "));
            start_element("fontconfig");
        }

        ~ XmlWriter () {
            this.close();
        }

        /**
         * Returns the bytes written (may be 0 because of buffering)
         *  or -1 in case of error
         */
        public int close () {
            end_element();
            end_document();
            return flush();
        }

    }

}

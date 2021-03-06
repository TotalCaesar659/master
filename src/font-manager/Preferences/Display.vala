/* Display.vala
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
 * along with Font Manager.  If not, see <http://www.gnu.org/licenses/gpl-3.0.txt>.
 *
 * Author:
 *        Jerry Casiano <JerryCasiano@gmail.com>
*/


namespace FontManager {

    namespace Preferences {

        public class Display : FontConfig.PreferencePane {

            FontConfig.DisplayPropertiesPane pane;

            public Display () {
                pane = new FontConfig.DisplayPropertiesPane();
                pack_start(pane, true, true, 0);
                connect_signals();
            }

            public override void show () {
                pane.show();
                base.show();
                return;
            }

            void connect_signals () {
                controls.save_selected.connect(() => {
                    pane.properties.save();
                    show_message(_("Settings saved to file."));
                });
                controls.discard_selected.connect(() => {
                    pane.properties.discard();
                    show_message(_("Removed configuration file."));
                });
                return;
            }

        }

    }

}

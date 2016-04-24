/* ReactiveLabel.vala
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

public class ReactiveLabel : Gtk.EventBox {

    public signal void clicked ();

    public Gtk.Label label { get; private set; }

    public ReactiveLabel (string? str) {
        Object(name: "ReactiveLabel");
        label = new Gtk.Label(str);
        label.opacity = 0.65;
        add(label);
    }

    public override void show () {
        label.show();
        base.show();
        return;
    }

    public void set_markup (string str) {
        label.set_markup(str);
        return;
    }

    public override bool enter_notify_event (Gdk.EventCrossing event) {
        label.opacity = 0.95;
        return false;
    }

    public override bool leave_notify_event (Gdk.EventCrossing event) {
        label.opacity = 0.65;
        return false;
    }

    public override bool button_press_event (Gdk.EventButton event) {
        this.clicked();
        return false;
    }

}

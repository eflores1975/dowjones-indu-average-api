ActiveRecord::Schema.define(version: 0) do
	enable_extension "plpgsql"

	create_table "dowjonesindustrial", id: false, force: :cascade do |t|
		t.integer  "id",         limit: 2,  default: "nextval('dowjones_id'::regclass)", null: false
		t.string   "symbl",      limit: 6
		t.string   "coname",     limit: 40
		t.decimal  "price"
		t.decimal  "change"
		t.decimal  "changepct"
		t.integer  "volume"
		t.decimal  "changeytd"
		t.datetime "lastupdate",            default: "now()"
	end
end

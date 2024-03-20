# ByteHub: eLearning Platform Template

ByteHub is a free and open-source online learning platform template built with Ruby on Rails.

![landing page](https://app-data-vault.s3.us-west-2.amazonaws.com/landing_page.png "landing page")

## Features

- Highly customizable
- Responsive design
- User authentication/login support
- Account confirmation via mailer daemon
- Online forum where users can post and reply on board
- Multi-language support (I18n)

## Setup

### System Requirements
- Ruby: Version >= 3.x
- Node.js: Version >= 14.x
- npm or yarn for package management
- (Recommended) Ruby version managers, such as [RVM](https://rvm.io/), [rbenv](https://github.com/rbenv/rbenv), [chruby](https://github.com/postmodern/chruby), or [asdf](https://github.com/asdf-vm/asdf) to adjust the version

#### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 3.0.0`

#### Check your Rails version

```shell
rails -v
```

The ouput should start with something like `Rails 6.0.6.1`

#### Check your Node.js version

```shell
node -v
```

The ouput should start with something like `v14.21.3`

### Clone Repository

1. Open your terminal.

2. Navigate to the directory where you want to clone the repository.

3. Execute the following command to clone the repository:

    ```bash
    git clone <repository_url>
    ```

    Replace `<repository_url>` with the actual URL of this repository.

4. Once the repository is cloned, navigate into the directory using the `cd` command:

    ```bash
    cd rails-lms-template
    ```

### Development

1. Install dependencies

    Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

    ```shell
    bundle && yarn
    ```

2. Initialize the database

    ```shell
    rails db:create db:migrate db:seed
    ```

3. Start the development server:

    ```shell
    rails s
    ```

    After starting the development server, navigate to `http://localhost:3000` in your web browser to view the application.

### Customize

#### Environment variables

It's essential to properly set up the `master.key` and `credentials.yml.enc` files to manage sensitive information. This guide outlines the steps to set up these files so that you can access credentials within your Rails application.

1. Generate master.key

    The `master.key` file is used to decrypt `credentials.yml.enc`. If you're starting a new Rails application, this file is generated automatically. However, if you're working on an existing application or have lost the `master.key`, you'll need to generate a new one.

    ```bash
    rails credentials:edit
    ```

    Running this command will open an editor (usually Vi or Vim). You can exit immediately by pressing `:q`.

2. Setup Credentials

    Once you have `master.key` in place, you can edit `credentials.yml.enc` to include your sensitive information.

    ```bash
    rails credentials:edit
    ```

    This command will open your default editor. You can add your credentials in YAML format like so:

    ```yaml
    email:
    username: your_email@example.com
    password: your_password
    ```

    Save and close the editor.

3. Access Credentials in Rails Application

    To access these credentials in your Rails application, you can use `Rails.application.credentials` followed by the key you've defined in `credentials.yml.enc`.

    For example, to access the email username:

    ```ruby
    Rails.application.credentials.email[:username]
    ```

4. Ignoring master.key

    It's crucial not to commit your `master.key` to version control, especially in production environments. Ensure that `master.key` is listed in your `.gitignore` file:

    ```
    /config/master.key
    ```

#### User Authentication / SMTP Settings

This instruction outlines how to configure SMTP settings in specific files such as config/environments/development.rb, config/environments/production.rb, and config/initializers/devise.rb, since this app uses the Devise library for user authentication.

1. Open `config/environments/development.rb`
    This file contains configuration settings for the development environment of your Rails application.

2. Locate the SMTP Settings Section
    Within `config/environments/development.rb`, find the section where SMTP settings are defined. It typically looks like this:

    ```ruby
    config.action_mailer.smtp_settings = {
        :address              => 'smtp.example.com',
        :port                 => 587,
        :user_name            => 'your_username',
        :password             => 'your_password',
        :authentication       => :plain,
        :enable_starttls_auto => true
    }
    ```

3. Update SMTP Settings
    Replace the placeholder values with your actual SMTP settings. For example:

    ```ruby
    config.action_mailer.smtp_settings = {
        :address              => 'mail.yourmailerdomain.com',
        :port                 => ###,  # Replace ### with your SMTP port number
        :user_name            => Rails.application.credentials.email[:username],
        :password             => Rails.application.credentials.email[:password],
        :authentication       => :plain,
        :enable_starttls_auto => true
    }
    ```

4. Repeat for `config/environments/production.rb` (if applicable)
    If you have a separate configuration for the production environment, repeat steps 1-4 for `config/environments/production.rb`.

5. Update `config/initializers/devise.rb`
    Modify the mailer sender to match those used in your development or production environments. For example:

    ```ruby
    config.mailer_sender = Rails.application.credentials.email[:username]
    ```

6. Save the Changes

#### Role Assignment

Below is how to use the Rails console to assign an admin role to a specific user.

1. Open Terminal/Command Prompt: Navigate to your Rails application directory using the terminal or command prompt.

2. To start the Rails console, type the following command and press Enter:
    ```
    rails console
    ```

3. Once inside the Rails console, execute the following commands to find the user by their email:

    ```ruby
    u = User.where(email: "useremail@domain.com")
    user = u[0]
    ```

    Replace `"useremail@domain.com"` with the actual email of the user you want to assign the admin role to.

4. After retrieving the user, you can assign the admin role to the user using the following command:

    ```ruby
    user.role = "admin"
    ```

    If the user already has a different role and you want to assign the admin role conditionally, you can use the logical OR operator (`||`):

    ```ruby
    user.role = (user.role == "tester") ? "admin" : "tester"
    ```

5. After assigning the admin role, save the changes to the user record by executing:

    ```ruby
    user.save
    ```

6. Once you have completed the necessary changes, exit the Rails console by typing:

    ```ruby
    exit
    ```

#### Locales

This section outlines the steps to create a locale value in the `en.yml` file, stored in the `config/locales` directory. It also demonstrates how to incorporate this locale value into an `.erb` file for rendering purposes.

1. Navigate to `config/locales` Directory:
    Open your Rails application directory in your terminal or code editor.

2. Locate or Create `en.yml` File:
    Inside the `config/locales` directory, locate the `en.yml` file. If it doesn't exist, create it.

3. Define Locale Value:
    Open `en.yml` file and add the desired locale value. For example:
    ```yaml
    en:
        greetings:
        hello: "Hello, world!"
    ```
    Here, `greetings` is a key, and `hello` is a sub-key with the corresponding value "Hello, world!".

4. Save Changes:
    Save the changes made to the `en.yml` file.

5. Incorporating Locale into `.erb` File:
    Now, you can incorporate this locale value into your `.erb` file for rendering.

    For example, assuming you want to use the `hello` value in a view file (`index.html.erb`), you can do the following:
    ```erb
    <h1><%= t('greetings.hello') %></h1>
    ```
    This `t` helper method fetches the translation string from the locale file based on the provided key.

6. Verify Changes:
    Start or restart your Rails server (`rails server`) and navigate to the corresponding page where you've included the locale value. You should see the translated text rendered.

## Database Schema

The diagram below shows the contents and relationships between all models used in this application.

![uml diagram](https://app-data-vault.s3.us-west-2.amazonaws.com/UML.png "uml diagram")

### Creating a New Table

To create a new table in your database, follow these steps:

1. Generate a migration file using the following command:
    ```
    rails generate migration CreateTableName
    ```
    Replace `TableName` with the desired name for your table.

2. Open the generated migration file located in `db/migrate/`.

3. Use the Rails migration methods to define the table schema, such as `create_table` and column definitions.

4. Run the migration to apply the changes to the database:
    ```
    rails db:migrate
    ```

### Adding a New Column

To add a new column to an existing table, proceed as follows:

1. Generate a migration file using the following command:
    ```
    rails generate migration AddColumnNameToTableName column_name:data_type
    ```
    Replace `ColumnName` with the name of the new column, `TableName` with the name of the table, and `data_type` with the desired data type for the column.

2. Open the generated migration file located in `db/migrate/`.

3. Use the `add_column` method within the migration to add the new column to the table.

4. Run the migration to apply the changes to the database:
    ```
    rails db:migrate
    ```

### Removing a Column

To remove a column from an existing table:

1. Generate a migration file using the following command:
    ```
    rails generate migration RemoveColumnNameFromTableName column_name:data_type
    ```
    Replace `ColumnName` with the name of the column to be removed, and `TableName` with the name of the table.

2. Open the generated migration file located in `db/migrate/`.

3. Use the `remove_column` method within the migration to remove the specified column from the table.

4. Run the migration to apply the changes to the database:
    ```
    rails db:migrate
    ```

### Rolling Back Migrations

If you need to revert a migration, you can use the following command:
```
rails db:rollback
```
This command will revert the last migration applied to the database.

### Additional Resources

For more detailed information on database migrations and ActiveRecord in Rails, refer to the [Rails documentation](https://guides.rubyonrails.org/).

## Contributing

Contributions are welcome! If you want to contribute to ByteHub, please fork the repository and create a pull request with your changes.

## License

ByteHub is licensed under the [MIT License](LICENSE). Feel free to use, modify, and distribute it according to the terms of the license.
FROM ruby:3.3.0-slim-bullseye AS app

WORKDIR /app

# Instala dependências e ferramentas necessárias
RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential curl libpq-dev \
    && rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man \
    && apt-get clean \
    && useradd --create-home ruby \
    && chown ruby:ruby -R /app

USER ruby

# Copie os arquivos Gemfile e Gemfile.lock e instale as dependências
COPY --chown=ruby:ruby Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install

# Copie o restante dos arquivos
COPY --chown=ruby:ruby . .

# Exponha a porta que o Rails usará
EXPOSE 8000

# Defina o comando padrão para iniciar o Rails
CMD ["rails", "s"]
